# Escrita humana

Tira mais de 20 padrões de escrita de IA de um texto em português sem achatar a voz de quem
escreveu.

## Instalar

É **um arquivo só**, o mesmo para todo lugar: `escrita-humana.md`. As regras e a checagem estão
juntas dentro dele.

**No Claude, no navegador ou no celular:** baixe o
**[escrita-humana.md](https://github.com/felipemasadaia/escrita_humana/raw/main/escrita-humana.md)**
e suba em **Configurações → Capabilities → Skills → `+` → Create skill**.

**No Claude Code:** cole `Instale a skill /escrita-humana globalmente a partir de
https://github.com/felipemasadaia/escrita_humana` na conversa.

**Passo a passo com telas, ChatGPT, Codex e o que fazer se der erro no upload:**
👉 **[COMO-INSTALAR.md](COMO-INSTALAR.md)**

## O problema

Ficou fácil gerar texto limpo, e todo texto limpo saiu igual. Mesmo os melhores modelos continuam
produzindo linha assim:

- "Você já parou para pensar…?"
- "Não é sobre X. É sobre Y."
- "Vale ressaltar que, no cenário atual, isso é um divisor de águas."
- "No fim, tecnologia é sobre pessoas."

E quando você usa uma IA para *editar*, ela costuma passar o rodo justamente no vocabulário, na
cadência, no humor e nas imperfeições que faziam o texto soar como você.

Em português tem uma camada a mais. Boa parte do que sai de um modelo aqui é tradução disfarçada:
"no final do dia", "deixa eu ser claro", "aqui está o que", "isso muda tudo": padrões que nasceram
em inglês e chegaram com sotaque. Outra parte é nossa mesmo, herdada da redação escolar e do post
de LinkedIn: o rodízio de sinônimos para "não repetir palavra", o "vale ressaltar", o gerundismo,
o "e é sobre isso" no fim.

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
escreveu. Detector de IA chuta, padrão nomeado é prova que você confere sozinho.

### Gerar slop de propósito

```text
/escrita-humana escreve isso com a maior cara de IA possível: (seu tema)
```

Ela empilha os padrões sem economia. Serve para satirizar e para testar se a skill pega o próprio
veneno.

## O que ela pega

Os 22 padrões, entre eles:

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
| Travessão | qualquer travessão, sem exceção |
| Decalque do inglês | "no final do dia", "entregar valor" |
| Formalidade postiça e gerundismo | "vou estar enviando", "o mesmo pediu" |

Mais a lista de palavras banidas (alavancar, potencializar, disruptivo, divisor de águas,
holístico, jornada, mergulhar fundo, acionável…), os advérbios vazios e os conectivos no piloto
automático.

O travessão tem tratamento próprio, e é a regra mais dura daqui: não sobra nenhum. Vírgula,
parênteses, ponto e vírgula, ponto ou aspas de fala fazem o serviço, e a skill escolhe conforme o
que o travessão estava fazendo na frase. É mais rígido do que a gramática pediria, porque o
travessão é legítimo em português. A troca é consciente: ele virou a assinatura do texto de
máquina, e parecer robô custa mais caro do que ele acrescenta.

## O que ela não faz

- Não inventa fato, nome, número, data nem citação que não esteja no seu texto.
- Não dá nota, não mede porcentagem de IA e não afirma quem escreveu.
- Não reescreve a frase boa só para deixar tudo uniforme.
- Não troca palavrão, opinião forte nem humor por uma versão mais profissional.

## Como ela se corrige

O arquivo termina numa seção **Checagem**: 35 perguntas de passou ou falhou que a skill roda
contra o próprio resultado antes de te devolver o texto. Se alguma falha, ela conserta e confere
de novo. É o que segura o exagero: seis das perguntas existem só para impedir que ela corte
demais.

## Créditos

Feita a partir da [`no-ai-slop`](https://github.com/petergyang/no-ai-slop), do
[Peter Yang](https://github.com/petergyang), MIT. A estrutura vem dela: editar, apontar e gerar
slop, princípios de edição, padrões nomeados e um eval que a skill roda contra si mesma. Os padrões, as palavras e
os exemplos foram reescritos para o português do Brasil, porque metade da lista original não existe
aqui ("delve", "tapestry", "leverage") e metade da nossa não estava lá.

## Licença

MIT. Veja [LICENSE](LICENSE).
