# Como instalar

**É um arquivo só: [`escrita-humana.md`](escrita-humana.md).** Não existe segundo arquivo para
instalar, não existe zip, não tem o que escolher.

Para baixar: abra o arquivo aqui no GitHub e clique no botão de download, no canto direito. Ou
clique em **Raw**, depois salve a página.

---

## Claude: navegador, celular, computador

1. Baixe o [`escrita-humana.md`](escrita-humana.md).
2. No Claude, abra **Configurações → Capabilities → Skills**.
3. Clique em **`+`** e depois em **Create skill**.
4. Arraste o arquivo para a área de upload.
5. Espere a verificação de segurança, que leva um ou dois minutos.
6. Deixe a chave da skill ligada na lista.

Pronto. Não precisa chamar pelo nome: peça "tira a cara de IA desse texto" e o Claude escolhe a
skill sozinho.

**Duas condições**, e sem elas a opção nem aparece:

- **Code execution** ligado em Configurações → Capabilities.
- Plano **Pro, Max, Team ou Enterprise**. No plano gratuito não existe.

---

## Claude Code

Cole isto na conversa:

```text
Instale a skill /escrita-humana globalmente a partir de https://github.com/felipemasadaia/escrita_humana
```

Ou, pelo terminal:

```sh
npx skills add felipemasadaia/escrita_humana --skill escrita-humana --global --yes
```

À mão também funciona:

```sh
git clone https://github.com/felipemasadaia/escrita_humana.git
mkdir -p ~/.claude/skills
cp -r escrita_humana/skills/escrita-humana ~/.claude/skills/
```

Trocando `~/.claude/skills` por `.claude/skills`, ela vale só naquele projeto.

---

## Codex e outros agentes de terminal

O mesmo `npx skills add` acima. O instalador não é do Claude: ele grava a pasta da skill no
lugar que o seu agente lê.

---

## ChatGPT

O ChatGPT não instala skill; o formato é do Claude. O conteúdo, porém, é só texto.

**Para usar sempre:** crie um **Projeto**, anexe o [`escrita-humana.md`](escrita-humana.md) como
arquivo e ponha isto nas instruções do projeto:

```text
Sempre que eu pedir para editar um texto, siga o escrita-humana.md anexado e confira o
resultado contra a seção Checagem antes de me responder.
```

⚠️ **Anexe como arquivo, não cole no campo de instruções.** São quase 19 mil caracteres, e o
campo não aceita esse tamanho.

**Para usar uma vez só:** cole isto na conversa.

```text
Leia https://raw.githubusercontent.com/felipemasadaia/escrita_humana/main/escrita-humana.md e
siga essas regras para editar o texto que eu mandar a seguir.
```

---

## Se der erro no upload

**"SKILL.md must start with YAML frontmatter (---)"**: o upload não encontrou o cabeçalho. Duas
causas: você subiu um zip com uma pasta em volta do arquivo, ou subiu outro arquivo por engano. O
`escrita-humana.md` daqui não tem pasta e começa no cabeçalho, então suba ele direto.

**O arquivo baixou como página HTML**: você salvou a página do GitHub em vez do arquivo. Use o
botão de download do GitHub, ou clique em **Raw** antes de salvar.

**A opção "Skills" não aparece nas configurações**: falta ligar **Code execution**, ou o plano é
o gratuito.

---

## Onde cada coisa mora

| Caminho | O que é |
| --- | --- |
| [`escrita-humana.md`](escrita-humana.md) | o arquivo para baixar e subir, com regras e checagem juntas |
| `skills/escrita-humana/SKILL.md` | o mesmo conteúdo, no formato de pasta que o `npx` e o Claude Code leem |
| `exemplos/` | três textos para testar, com os padrões plantados e listados |

Os dois primeiros são cópias do mesmo arquivo. Se editar a skill, edite
`skills/escrita-humana/SKILL.md` e copie por cima do outro:

```sh
cp skills/escrita-humana/SKILL.md escrita-humana.md
```
