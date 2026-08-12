# Escrita humana

Tira mais de 20 padrões de escrita de IA de um texto em português sem achatar a voz de quem
escreveu.

## O problema

Ficou fácil gerar texto limpo — e todo texto limpo saiu igual. Mesmo os melhores modelos continuam
produzindo linha assim:

- "Você já parou para pensar…?"
- "Não é sobre X. É sobre Y."
- "Vale ressaltar que, no cenário atual, isso é um divisor de águas."
- "No fim, tecnologia é sobre pessoas."

E quando você usa uma IA para *editar*, ela costuma passar o rodo justamente no vocabulário, na
cadência, no humor e nas imperfeições que faziam o texto soar como você.

Em português tem uma camada a mais. Boa parte do que sai de um modelo aqui é tradução disfarçada:
"no final do dia", "deixa eu ser claro", "aqui está o que", "isso muda tudo" — padrões que nasceram
em inglês e chegaram com sotaque. Outra parte é nossa mesmo, herdada da redação escolar e do post
de LinkedIn: o rodízio de sinônimos para "não repetir palavra", o "vale ressaltar", o gerundismo,
o "e é sobre isso" no fim.

## Baixar

**[⬇️ escrita-humana.zip](https://github.com/felipemasadaia/escrita_humana/raw/main/escrita-humana.zip)** — 11 KB, é o arquivo que o Claude pede no upload.

## Como instalar

### Claude no navegador, no celular ou no computador

O Claude não instala skill por URL de repositório: ele lê um `.zip`. Baixe o arquivo do link
acima e vá em **Configurações → Capabilities → Skills → `+` → Create skill**, subindo o arquivo.
Depois deixe a skill ligada na lista.

Duas condições: **Code execution** precisa estar ligado em Configurações → Capabilities, e o
recurso existe nos planos Pro, Max, Team e Enterprise.

### Claude Code

Cole isto na conversa:

```text
Instale a skill /escrita-humana globalmente a partir de https://github.com/felipemasadaia/escrita_humana
```

Ou pelo terminal:

```sh
npx skills add felipemasadaia/escrita_humana --skill escrita-humana --global --yes
```

### Codex e outros agentes de terminal

O mesmo `npx` acima. O instalador é agnóstico de agente — ele grava a pasta da skill no lugar que
o seu agente lê.

### ChatGPT

O ChatGPT não tem instalação de skill. O que funciona é abrir um **Projeto**, colar o conteúdo de
[`skills/escrita-humana/SKILL.md`](skills/escrita-humana/SKILL.md) nas instruções dele e conversar
dentro do projeto. Perde a checagem automática do `eval.md`; para recuperá-la, cole também o
`eval.md` e peça que ele confira o resultado contra a lista antes de responder.

### Refazer o `.zip` depois de editar

```sh
cd skills && zip -r ../escrita-humana.zip escrita-humana
```

A pasta `escrita-humana/` precisa ficar na raiz do arquivo, com `SKILL.md` e `eval.md` dentro. É o
formato que o upload exige.

## Como usar

### Editar

```text
/escrita-humana (seu texto)
```

A skill tira os padrões, preserva a sua voz e lista o que mudou.

### Apontar sem reescrever

```text
/escrita-humana isso tem cara de IA? (seu texto)
```

Ela nomeia cada padrão que encontrou e cita a linha. Não dá nota ao texto e não chuta se uma IA
escreveu — detector de IA chuta, padrão nomeado é prova que você confere sozinho.

## O que ela pega

Mais de 20 padrões, entre eles:

| Padrão | Exemplo |
| --- | --- |
| Pergunta retórica de abertura | "Você já parou para pensar…?" |
| Contraste binário | "Não é sorte. É método." |
| Pigarro de abertura | "Deixa eu ser claro" |
| Falso insight | "O que ninguém te conta" |
| Revelação com dois-pontos | "Spoiler: não funcionou." |
| Pergunta autorrespondida | "Resultado? Dobrou." |
| Análise superficial de gerúndio | "…, reforçando o compromisso da empresa" |
| Inflação de importância | "é um marco", "veio para ficar" |
| Metadiscurso interpretativo | "E isso é mais importante do que parece" |
| Atribuição vaga | "especialistas afirmam" |
| Verbo forte de mentira | "atua como um hub centralizado" |
| Rodízio de sinônimos | a ferramenta / a solução / a plataforma |
| Frase de efeito no fim | "No fim, tecnologia é sobre pessoas." |
| Fecho-resumo | "Em suma", "Em última análise" |
| Pedido de engajamento reflexo | "Comenta aqui embaixo" |
| Travessão decorativo | o travessão como muleta de ritmo |
| Decalque do inglês | "no final do dia", "entregar valor" |
| Formalidade postiça e gerundismo | "vou estar enviando", "o mesmo pediu" |

Mais a lista de palavras banidas (alavancar, potencializar, disruptivo, divisor de águas,
holístico, jornada, mergulhar fundo, acionável…), os advérbios vazios e os conectivos no piloto
automático.

O travessão tem tratamento próprio, e de propósito: em português ele é legítimo — abre fala e isola
aposto, e nesse uso fica. O que sai é o travessão como muleta de ritmo no meio da frase, três vezes
no mesmo parágrafo, quase sempre decalcado do inglês. Uma tradução literal da regra em inglês
estragaria diálogo.

## O que ela não faz

- Não inventa fato, nome, número, data nem citação que não esteja no seu texto.
- Não dá nota, não mede porcentagem de IA e não afirma quem escreveu.
- Não reescreve a frase boa só para deixar tudo uniforme.
- Não troca palavrão, opinião forte nem humor por uma versão mais profissional.

## Como ela se corrige

A skill tem dois arquivos. O `SKILL.md` edita; o `eval.md` é a lista de checagens que ela roda
contra o próprio resultado antes de te devolver o texto. Se alguma checagem falha, ela conserta e
confere de novo.

## Créditos

Feita a partir da [`no-ai-slop`](https://github.com/petergyang/no-ai-slop), do
[Peter Yang](https://github.com/petergyang), MIT. A estrutura — duas funções, princípios de edição,
padrões nomeados e um eval que a skill roda contra si mesma — vem dela. Os padrões, as palavras e
os exemplos foram reescritos para o português do Brasil, porque metade da lista original não existe
aqui ("delve", "tapestry", "leverage") e metade da nossa não estava lá.

## Licença

MIT. Veja [LICENSE](LICENSE).
