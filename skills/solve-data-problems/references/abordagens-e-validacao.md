# Escolher a abordagem e sua evidência

Leia apenas as rotas pertinentes. Os métodos são opções, não uma lista obrigatória nem um limite aos recursos do projeto. Comece com a abordagem mais simples capaz de responder à pergunta e amplie mediante lacuna observada.

| Pergunta | Ponto de partida | Evidência principal e cuidados |
| --- | --- | --- |
| O que ocorre, onde e com quem? | Consultas, estatística descritiva, visualizações | Unidade, denominador, período, dados ausentes e viés de seleção. Associação não identifica causa. |
| Qual classe ou conjunto de classes? | Classe majoritária/regras; modelo tabular simples ou TF-IDF + modelo linear para texto | Precision/recall/F1 por classe, matriz de confusão, médias macro/micro conforme tarefa e suporte. Accuracy isolada esconde classes raras. Para multilabel, definir codificação e métricas próprias. |
| Qual valor numérico? | Mediana/média ou regra vigente, regressão simples | MAE/RMSE nas unidades do alvo, resíduos e erro por faixa/grupo. MAPE exige tratamento de zeros; desvio entre totais permite cancelamento e não mede erro individual. |
| O que acontecerá no futuro? | Último valor, média ou padrão sazonal | Divisão cronológica, backtesting e horizonte coerentes com o uso. Atributos só podem usar informação disponível na data da previsão; conferir sazonalidade e mudanças de regime. |
| Há grupos úteis? | Representação/escala/distância justificadas e algoritmo simples | Estabilidade, interpretação e medidas internas adequadas à geometria. Rótulos externos ajudam a avaliar, mas não devem orientar uma suposta descoberta independente sem declaração. Grupos não são classes verdadeiras por definição. |
| Há casos anormais? | Limiares do processo, estatística robusta ou detector simples | Revisão por especialista, precisão na capacidade real de investigação e avaliação de falhas conhecidas. Raridade não implica erro ou fraude; anomalia é um sinal para investigar. |
| Como representar texto/documentos? | Extração + regras ou TF-IDF; depois embeddings, LLM ou layout se necessário | Compare informação disponível, qualidade da leitura, cobertura, acerto da tarefa e custo. Embedding não é rótulo; similaridade não é probabilidade. |

## Dados e desenho de validação

- Agrupe duplicatas, versões e entidades correlacionadas antes da divisão. Para documentos, investigue processo, autor/origem e template além do hash; textos diferentes do mesmo gerador podem continuar muito semelhantes.
- Escolha divisão aleatória, por grupo, temporal ou por origem conforme a população futura pretendida. Se houver restrições simultâneas, documente como foram combinadas.
- Ajuste transformações e reamostragem no treino de cada fold. Mantenha o teste fora da seleção de hiperparâmetros, prompts, exemplos few-shot e limiares.
- Sem rótulos confiáveis, ofereça exploração, regras revisáveis ou protocolo de anotação. Pseudorrótulos e respostas de outra IA não substituem referência humana independente para demonstrar qualidade real.
- Registre autoria e instruções de anotação, desacordos e adjudicação quando o rótulo depender de interpretação. Classes ausentes ou raras limitam conclusões; não invente uma meta numérica para compensar falta de evidência.
- Em amostras pequenas, use intervalos ou reamostragem na unidade independente correta quando viável e declare a limitação. Não trate milhares de páginas do mesmo processo como milhares de exemplos independentes.
- Para análises exploratórias, não imponha um holdout sem finalidade. Se passar da exploração a uma afirmação confirmatória ou preditiva, estabeleça avaliação apropriada e declare a reutilização dos dados.

## Avaliação documental em camadas

1. **Ingestão e extração:** originais preservados, páginas identificadas, texto utilizável, leitura parcial e falhas explícitas. OCR pode exigir CER/WER com transcrição e medição do impacto na tarefa.
2. **Tarefa semântica:** distinguir tipo documental, assunto multilabel, extração de campos e classe oficial. Uma citação literal pode existir sem sustentar a conclusão; conferir a relação semântica.
3. **Decisão e revisão:** qualidade entre casos aceitos, cobertura, erros críticos, casos fora da taxonomia e carga humana. Medir risco em função da cobertura; recusar tudo não automatiza nada.
4. **Operação:** latência, throughput, memória, custo por unidade, retomada, rastreabilidade e acesso. Cache deve depender de conteúdo e versões relevantes, sem apagar origens/permissões de cópias iguais.

## Quando avançar de complexidade

- De regra para modelo supervisionado: erros recorrentes que os dados rotulados podem resolver.
- De TF-IDF para embeddings/LLM: ambiguidade semântica ou contexto que o baseline demonstravelmente não captura.
- De texto para layout/visão: informação essencial na estrutura visual ou perda na extração.
- De inferência pronta para ajuste/fine-tuning: lacuna persistente, dados adequados, orçamento e comparação controlada disponíveis.
- De piloto para escala: qualidade em referência real, limites operacionais e revisão humana demonstrados. Estimativas devem indicar amostra, hipóteses, variação e gargalos; não multiplicar desempenho sintético por terabytes.

Uma comparação malsucedida também é resultado útil: documente por que o baseline é suficiente ou por que ainda faltam dados, sem escolher o vencedor pelo resultado mais favorável de execuções incomparáveis.
