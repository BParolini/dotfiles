# Configuração de fontes para aplicações que utiliam o Wine (PlayOnLinux)

Após instalar o msttcore-fonts e fazer o link para as fontes do usuário:

1. Ir para o diretório de fontes do Windows dentro da instalação no Wine:
    1. Por exemplo: `~/PlayOnLinux's virtual drives/FantasyGrounds/drive_c/windows/Fonts`;
1. Executar os comandos:
    1. `for i in /usr/share/fonts/**/*.ttf; do ln -s "$i" 2> /dev/null; done`;
    1. `for i in ~/.fonts/**/*.ttf; do ln -s "$i" 2> /dev/null; done`;
1. Executar o Regedit do Wine / PlayOnLinux, e adicionar as entradas:

> [HKEY_CURRENT_USER\Control Panel\Desktop]  
> "FontSmoothing"="2"  
> "FontSmoothingOrientation"=dword:00000001  
> "FontSmoothingType"=dword:00000002  
> "FontSmoothingGamma"=dword:00000578
