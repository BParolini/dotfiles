# [Terminal com Oh My Zsh, Spaceship, Dracula e mais](https://blog.rocketseat.com.br/terminal-com-oh-my-zsh-spaceship-dracula-e-mais/)
por [Diego Fernandes](https://blog.rocketseat.com.br/author/diego/)

---
###### tags: `Article` `Linux` `Customization` `Dev`
---

Durante toda história da Rocketseat existem duas perguntas que as pessoas mais me fazem, o tema do meu VSCode (que é o Dracula) e as configurações do meu terminal de desenvolvimento.

Antes de mais nada, nesse post vou considerar que você esteja utilizando Unix (Mac ou Linux) já que no Windows fica bem inviável configurar o que eu menciono nesse post a não ser que você crie um subsistema Linux dentro dele.

A minha ideia com esse post é mostrar exatamente todas configurações que faço em meu terminal como tema, plugins, configurações, etc.

## Instalando Zsh

Antes de conseguirmos iniciar com qualquer configuração precisamos instalar o Zsh. Como existem várias formas de instalação dependendo do sistema operacional que você está, leia esse guia: https://github.com/robbyrussell/oh-my-zsh/wiki/Installing-ZSH

Com o Zsh instalado deve ser possível você **executar**:
```
zsh --version
```

E receber algo como: `zsh 5.3 (x86_64-apple-darwin18.0)`.

## Instalando Oh My Zsh

Para instalar o Oh My Zsh você precisa executar o comando abaixo (você deve ter o cURL instalado para executa-lo):
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```
A partir de agora **todas configurações** que você quer fazer como adicionar variáveis ambientes ou **configurar** seu terminal de qualquer forma **utilize o arquivo** `~/.zshrc` e não mais o `~/.bash_profile` ou derivados.

Agora **reiniciando seu terminal** você deve ter algo diferente do convencional, parecido com isso:

<img src="https://blog.rocketseat.com.br/content/images/2019/05/image-1.png" alt="zsh" style="display: block; margin: auto;">

_Lembrando que a ainda vamos realizar configurações de cores, informações que aparecem em tela, etc._

## Utilizando Dracula

Dracula é um padrão de cores disponível para muitas aplicações de desenvolvimento e hoje utilizo esse esquema em boa parte dos apps em que desenvolvo.

O Dracula está disponível para muitos terminais e você pode conferir todos aqui: https://draculatheme.com na seção "Terminal".

Se você estiver no **Mac** usando o **Terminal** padrão, provavelmente irá usar: https://draculatheme.com/terminal/

Se você estiver no **Linux** com uma distribuição que usa **Gnome**, vai utilizar: https://github.com/dracula/gnome-terminal

## Tema Spaceship

Agora vamos instalar o tema Spaceship que vai modificar um pouco as informações que são exibidas no terminal, com ele podemos mostrar a versão do Node atual, do Docker, etc.

### Instalando FiraCode

Antes de iniciar a configuração do Spaceship precisamos **instalar a fonte Fira Code** que possui diversos ícones dos quais são utilizados nesse tema. Baixe o zip da última versão da fonte disponível aqui: https://github.com/tonsky/FiraCode/releases

Descompacte o arquivo baixado e na pasta TTF copie os arquivos de fonte para as fontes do seu sistema (cada sistema operacional possui uma forma de fazer isso).

Depois disso será necessário **configurar seu terminal com essa fonte**, abaixo mostro uma imagem de como configurei no Mac:

<img src="https://blog.rocketseat.com.br/content/images/2019/05/Screen-Shot-2019-05-02-at-10.11.48.png" alt="zsh" style="display: block; margin: auto;">

### Instalando Spaceship

Vamos começar **clonando o repositório** do Spaceship em nossa pasta de themes do Oh My Zsh (é necessário ter instalado o Git pra isso):
```
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
```
Agora vamos criar um link simbólico para o arquivo do tema do Spaceship na pasta dos temas do Oh My Zsh:
```
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
```
Agora dentro do arquivo ~/.zshrc vamos alterar a variável ZSH_THEME ficando dessa forma:
```
ZSH_THEME="spaceship"
```
Agora reinicie o terminal e você verá uma interface bem mais limpa, parecida com essa:

<img src="https://blog.rocketseat.com.br/content/images/2019/05/Screen-Shot-2019-05-02-at-10.08.19.png" alt="zsh" style="display: block; margin: auto;">

## Configurações adicionais

A partir de agora você já **finalizou** todas instalações e tudo a partir de aqui são **preferências minhas** que gosto de utilizar em meu terminal, por isso fique à vontade para incluir/excluir qualquer item abaixo.

### Configurando Spaceship

Por mais que seja muito interessante mostrar as versões do Node, Docker e outros itens no nosso terminal geralmente isso consome **processamento** e pode tornar mais lento o carregamento de pastas, por isso eu gosto de desabilitar a maioria dessas opções.

No fim do arquivo `~/.zshrc` adiciono o seguinte conteúdo:
```
SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  hg            # Mercurial section (hg_branch  + hg_status)
  exec_time     # Execution time
  line_sep      # Line break
  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)
SPACESHIP_USER_SHOW=always
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_CHAR_SYMBOL="❯"
SPACESHIP_CHAR_SUFFIX=" "
```

### Plugins do ZSH

Utilizo alguns plugins bem legais para o Oh My Zsh que facilitam muito na hora de executar comandos comuns, realizar autocompletes, etc...

Para instalar plugins precisamos configurar o ZPlugin, ferramenta que facilita a instalação e remoção de plugins no Zsh.
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"
```
Após essa instalação, vamos abrir o arquivo ~/.zshrc novamente e abaixo da linha ### End of Zplugin's installer chunk que foi adicionada automaticamente no arquivo, adicionamos:
```
zplugin light zdharma/fast-syntax-highlighting
zplugin light zsh-users/zsh-autosuggestions
zplugin light zsh-users/zsh-completions
```

Esses são os plugins que utilizo e abaixo explico como funciona cada um deles:

- `zdharma/fast-syntax-highlighting`: Adiciona syntax highlighting na hora da escrita de comandos que facilita principalmente em reconhecer comandos que foram digitados de forma incorreta;
- `zsh-users/zsh-autosuggestions`: Sugere comandos baseados no histórico de execução conforme você vai digitando;
- `zsh-users/zsh-completions`: Adiciona milhares de completitions para ferramentas comuns como Yarn, Homebrew, NVM, Node, etc, para você precisar apenas apertar TAB para completar comandos;

## Terminal no VSCode

Se, assim como eu, você utiliza o VSCode pode adicionar a seguinte configuração abaixo para utilizar o Oh My Zsh no terminal integrado:
```
"terminal.integrated.shell.osx": "/bin/zsh"
```

## Concluindo

Pronto, se você configurou todos passos acima então seu terminal deve estar exatamente **igual o meu** assim como mostro nas aulas :)

Meu arquivo `~/.zshrc` com **todas opções** acima está disponível em: https://gist.github.com/diego3g/b0513d5ff6d9d983c48bed3fd8f10cdb

Não esquece de deixar um **comentário** abaixo se você curtiu esse post e minhas configurações do terminal e também com dicas do que eu poderia adicionar :)
