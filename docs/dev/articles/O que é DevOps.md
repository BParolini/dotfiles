# [O que é DevOps](https://vertigo.com.br/o-que-e-devops/)
by [Daniel Delfino](https://vertigo.com.br/author/daniel-delfino/)

---
###### tags: `Dev` `Article` `DevOps`
---

<img src="https://vertigo.com.br/wp-content/uploads/o-que-%C3%A9-devops-1.png" alt="DevOps" style="display: block; margin: auto" />

**“O que é DevOps”** é uma pergunta mais difícil de se responder do que parece à primeira vista. Mas é possível apontar vários objetivos da prática de DevOps: velocidade e qualidade na entrega de valor, uso extensivo de automação para construção e testes, redução dos períodos em que as aplicações ficam fora do ar (downtimes),  eliminação do atrito entre desenvolvedores e operação e redução do tempo para lidar com falhas.

**DevOps** tem a meta principal melhorar a integração entre desenvolvedores de softwares e a equipe de infraestrutura. Em uma TI tradicional, a comunicação entre os dois sujeitos ainda é muito difícil: desenvolvedores são cobrados por entregar valor na forma de funcionalidades em aplicações, enquanto a operação (infra) é cobrada por manter a estabilidade do ambiente. Ambos são pressionados pela empresa em direção a esses objetivos, mas em uma TI tradicional eles parecem opostos.


Com o modelo de produção antigo este conflito é uma consequência natural: desenvolvedores têm pouco ou nenhum contato com o ambiente produtivo de suas entregas, assim como o formalismo imposto pelos silos operacionais tornam cada iteração uma repetição de problemas recorrentes.

Mas a prática e ferramental **DevOps** permitem que essa comunicação seja facilitada, modificando completamente as fronteiras de responsabilidade e favorecendo o trabalho de ambos os times, tornando muito mais fluida a entrega de valor no ambiente de tecnologia dentro de uma empresa.

## Como era para produzir tecnologia antes de DevOps?
Para começar a entender o modelo antigo de produção tecnológica, vamos lembrar do nosso ensino médio quando estudamos Revolução Industrial. Existia uma grande demanda por produtos manufaturados e foi necessária uma espécie de esteira de montagem para agilizar o processo.

Essa lógica também foi implementada na construção de software no modelo em cascata, que consistia no levantamento de requisitos, projeto, implementação, teste, implantação e manutenção. Frequentemente  (muito mesmo!) ele gerava problemas de toda ordem.

Um dos problemas é que a tecnologia possui um dinamismo avassalador, que faz com que os requisitos sejam alterados a todo o tempo. Outra dificuldade é que o cliente dificilmente sabe exatamente o que quer quando pede um software – e mesmo quando sabe, frequentemente está errado, pois o que o usuário final realmente precisa pode ser ainda diferente.

Por essa razão, fez-se necessária a criação de metodologias ágeis para conduzir projetos de software, e estas mesmas metodologias demandaram práticas e ferramentas totalmente diferentes das que estavam em uso até então, reordenando completamente as fronteiras que definiam os papéis de desenvolvimento e infraestrutura. Como dissemos no início do texto, não existe uma fórmula mágica de fazer **DevOps**, mas vamos indicar as práticas mais comuns e suas ferramentas. Confira abaixo!

## O Casamento DevOps/Agile
Você se lembra quando falamos do problemático modelo de desenvolvimento em cascata? Ao longo dos anos várias outras metodologias foram experimentadas pela indústria de TI. Os métodos ágeis têm a hegemonia atual porque assumem explicitamente que a produção de aplicações é um ciclo contínuo e que o excesso de formalismo na coleta de requisitos é perda de tempo.

A **prática DevOps** possui algumas diretrizes: Algumas utilizam ferramentas que propiciam colaboração e integração contínua entre Desenvolvimento e Infraestrutura. Elaboramos um esquema abaixo que ilustra de forma resumida a adoção de DevOps, mas ao longo do nosso conteúdo explicaremos melhor pontos interessantes na hora de adotar a prática. Confira abaixo.

<img src="https://vertigo.com.br/wp-content/uploads/MATURIDADE-DEVOPS-2-e1549546222599.png" alt="Maturidade DevOps" style="display: block; margin: auto" />

## Gerenciamento de Configuração/ Provisionamento

Uma empresa comum possui uma grande quantidade de servidores (quer sejam em datacenter privado ou em nuvem). Na metodologia DevOps é impensável fazer qualquer atualização ou instalação em cada uma delas individualmente, por isso- e outras razões – se utilizam gerenciadores de configurações.

Programas como Puppet Lab, SaltStack e o Ansible permitem o monitoramento da operação das máquinas (físicas e virtuais), solução automática de serviços fora do ar e correção automática caso alguém faça alguma alteração indevida no sistema – estas soluções visam manter os servidores em um estado desejado.

## Containers e Orquestração
A orquestração também tem como foco ter uma infraestrutura ágil, que permite mudanças e possui escalabilidade. Os containers Docker e seus orquestradores ajudam a construir, entregar e executar qualquer aplicação em qualquer ambiente, independente do local onde esteja implantada. Assim temos Agilidade, Controle e Versionamento, melhor interação entre equipes e um ambiente bem mais resiliente.

Como exemplos de ferramenta temos Docker e Kubernetes. Essas ferramentas permitem administração e escalonamento de clusters, facilitação de implantação de infraestrutura, facilita a criação de ambientes “descartáveis” (pode ser destruído ou criado sem efeito colateral).

## Mudança de Cultura
Ao longo deste texto temos repetido que **DevOps** é uma soma de práticas e ferramentas. Contudo, sua razão de existir, sua motivação original, tem sua parte comportamental como elemento intangível mais importante. Conforme dissemos, a adoção de **DevOps** requer outra forma de integração entre departamentos que originalmente possuíam interesses diversos.

Muitas responsabilidades (e talentos) que antes eram típicos de operação migram para dentro dos projetos, que ganham soberania para definir em seu próprio código vários aspectos de infraestrutura – e com esta autonomia vem também a responsabilidade para os eventuais problemas de suas entregas.

Que fique claro portanto que a mudança de cultura é imprescindível para **adoção de DevOps**. Em uma TI tradicional vigoram mecanismos de transferência de culpa e de abandono de responsabilidade, enquanto em uma TI “pós-DevOps” a responsabilidade pela entrega é compartilhada e automatiza-se tudo que é possível (testes e entregas principalmente).

**DevOps** implica em uma palavra que está sendo cada vez mais ouvida: Empatia. É preciso o mantra constante “Trate o erro, monitore e documente”.

A sensibilidade quanto ao trabalho do outro setor precisa ser inerente ao trabalho. É necessário documentar e monitorar os problemas para que os erros não se repitam e que as soluções sejam democratizadas.

Como dissemos, os procedimentos citados acima não são necessariamente obrigatórios. Não existe um modo certo. Mas existem caminhos que são utilizados para que **DevOps** seja feito.

Essa prática traz benefícios muito contundentes para as empresas que os implementam.  É isso que vamos conferir no próximo tópico.

## Benefícios do DevOps
Os **benefícios do DevOps** são gigantes! Eles se adequam ao que o mundo tecnológico, sedento por novidades a todo tempo. Companhias que precisam de constantes atualizações como Facebook, Twitter, Spotify, Google e Amazon, foram os primeiros entusiastas. As vantagens vamos elencar a seguir:

### Melhoria de deployments
A **metodologia DevOps** auxilia no aumento da quantidade e frequência da entrega de atualizações em um determinado sistema, com uma baixíssima taxa de falhas e downtimes.

Com um maior volume de entregas, mais chances de estar de acordo com as diretrizes pedidas pelo clientes, tornando a empresa mais competitiva sob uma perspectiva de entrega de produtos.

### Segurança
Velocidade não significa insegurança. Com DevOps é possível operar rapidamente enquanto mantém a estrutura estável. O que a indústria aprendeu a duras penas é que a segurança por inconveniência é uma falácia. É possível utilizar políticas de conformidade automáticas e técnicas de gerenciamento, por exemplo. Dessa maneira é possível rastrear toda a conformidade escalada.

### Faster mean time to recovery (MTTR)
Com a utilização de DevOps o tempo médio de reparo é encurtado. Isso porque a metodologia agiliza sua própria manutenção, com os constantes monitoramentos e testes nas aplicações que estão sendo desenvolvidas. MTTR muito longo significam ineficiência, e consequentemente em custos.

Para quem ainda pertence ao mundo da “velha TI”, dos grandes datas centers, grande zeladora da estabilidade, o DevOps parece algo utópico. Mas, no mundo empresarial como vivemos, quem não se atualiza morre na praia. A nova TI preza por velocidade e utilização consciente de recursos.

Você já sabe o que é e os benefícios. Ficou curioso quanto a forma como tudo funciona? É exatamente sobre isso que falaremos a seguir para entender mais profundamente o que é DevOps.
