# Como instalar

Escolha onde você usa. O Claude no navegador e no celular é o caminho mais curto.

---

## Claude — navegador, celular, computador

**Baixe um arquivo e suba nas configurações.** Dois cliques.

1. Baixe **[escrita-humana.md](escrita-humana.md)** — clique no arquivo, depois no botão de
   download (a setinha, no canto direito).
2. No Claude, abra **Configurações → Capabilities → Skills**.
3. Clique em **`+`** e depois em **Create skill**.
4. Arraste o `escrita-humana.md` para a área de upload.
5. Espere a verificação de segurança, que leva um ou dois minutos.
6. Deixe a chave da skill ligada na lista.

Pronto. Não precisa chamar pelo nome: peça "tira a cara de IA desse texto" e o Claude escolhe a
skill sozinho.

**Duas condições**, e sem elas a opção nem aparece:

- **Code execution** ligado em Configurações → Capabilities.
- Plano **Pro, Max, Team ou Enterprise**. No plano gratuito não existe.

### Se der erro no upload

**"SKILL.md must start with YAML frontmatter (---)"** — o upload não achou o cabeçalho do
arquivo. Quase sempre é o `.zip` que está com uma pasta em volta do `SKILL.md`. Use o
**`escrita-humana.md`**, que não tem pasta nenhuma e não tem como dar esse erro.

**Prefere o zip?** Use o **[escrita-humana.zip](escrita-humana.zip)** daqui, que tem o `SKILL.md`
na raiz. Não monte o seu próprio zipando a pasta `escrita-humana/` — é isso que quebra.

**O arquivo baixou como página HTML** — você clicou com o botão direito e salvou a página do
GitHub. Abra o arquivo no GitHub e use o botão de download, ou clique em **Raw** e salve dali.

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

Para instalar só num projeto, copie a pasta à mão:

```sh
git clone https://github.com/felipemasadaia/escrita_humana.git
mkdir -p .claude/skills
cp -r escrita_humana/skills/escrita-humana .claude/skills/
```

Trocando `.claude/skills` por `~/.claude/skills`, ela passa a valer em todos os seus projetos.

---

## Codex e outros agentes de terminal

O mesmo `npx skills add` acima. O instalador não é do Claude — ele grava a pasta da skill no
lugar que o seu agente lê.

---

## ChatGPT

O ChatGPT não instala skill; o formato é do Claude. O conteúdo, porém, é só texto.

**Para usar sempre:** crie um **Projeto**, anexe o **[escrita-humana.md](escrita-humana.md)** como
arquivo e ponha isto nas instruções do projeto:

```text
Sempre que eu pedir para editar um texto, siga o escrita-humana.md anexado e confira o
resultado contra a seção Checagem antes de me responder.
```

⚠️ **Anexe como arquivo, não cole no campo de instruções** — são mais de 23 mil caracteres, e o
campo não aceita esse tamanho.

**Para usar uma vez só:** cole isto na conversa.

```text
Leia https://raw.githubusercontent.com/felipemasadaia/escrita_humana/main/escrita-humana.md e
siga essas regras para editar o texto que eu mandar a seguir.
```

---

## Qual arquivo é qual

| Arquivo | Para quê |
| --- | --- |
| `escrita-humana.md` | arquivo único, com a checagem embutida — serve para o Claude e para o ChatGPT |
| `escrita-humana.zip` | mesmo conteúdo em dois arquivos, com o `SKILL.md` na raiz |
| `skills/escrita-humana/` | a pasta original, que o Claude Code e o `npx` leem |

Os três saem do mesmo lugar. Se você editar a skill, refaça os dois primeiros com `sh montar.sh`.
