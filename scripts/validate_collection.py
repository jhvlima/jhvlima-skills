"""Validate the portable collection using only Python standard library."""
from pathlib import Path
import re

ROOT = Path(__file__).resolve().parents[1]
EXPECTED = {
    "solve-data-problems", "run-ml-experiments", "maintain-n8n-workflows",
    "maintain-project-documentation", "safe-git-integration", "repo-grounded-study",
    "evidence-first-research",
}
issues = []
found = {p.parent.name for p in (ROOT / "skills").glob("*/SKILL.md")}
if found != EXPECTED:
    issues.append("Unexpected skill inventory")
for path in ROOT.rglob("*"):
    if not path.is_file() or ".git" in path.parts:
        continue
    if path.is_symlink():
        issues.append(f"Symlink: {path.relative_to(ROOT)}")
    if path.suffix not in {".md", ".sh", ".yaml"}:
        continue
    text = path.read_text()
    forbidden = [r"/home/[^/\s]+/", r"gh[pousr]_" + r"[A-Za-z0-9]{20,}", r"sk-" + r"[A-Za-z0-9]{24,}", r"-----BEGIN " + r"(?:RSA |OPENSSH )?PRIVATE KEY-----"]
    if any(re.search(pattern, text) for pattern in forbidden):
        issues.append(f"Private path or secret pattern: {path.relative_to(ROOT)}")
    if path.name == "SKILL.md":
        header = text.split("---", 2)
        if len(header) < 3 or f"name: {path.parent.name}" not in header[1] or "description:" not in header[1]:
            issues.append(f"Invalid frontmatter: {path.relative_to(ROOT)}")
    if path.suffix == ".md":
        for target in re.findall(r"\[[^\]]*\]\(([^)]+)\)", text):
            if "://" in target or target.startswith("#") or target.startswith("mailto:"):
                continue
            target = target.split("#", 1)[0]
            if target and not (path.parent / target).exists():
                issues.append(f"Broken link: {path.relative_to(ROOT)} -> {target}")
if issues:
    raise SystemExit("\n".join(issues))
print(f"Validated {len(found)} skills, local references and portability checks.")
