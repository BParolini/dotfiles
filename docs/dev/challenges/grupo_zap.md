# Code Challenge Grupo ZAP

---

###### tags: `Dev` `Challenges` `Java`

---

No fim de 2017, os dois maiores portais imobiliários do país se fundiram. Esse desafio roda em torno do nosso dia-a-dia de integrar as tecnologias e regras de negócio de ambos, de maneira escalável e sustentável, para revolucionar o mercado imobiliário do Brasil.

## Código atual

O código atual é muito antigo, simples e cru (pra não dizer tosco). Ele é apenas utilizado como referência rápida e servirá de referência para esse challenge. Ele funciona assim -> dada uma fonte de dados, ele apenas tem a lógica de separar imóveis elegíveis pro **ZAP** ou pro **Viva Real**. Você pode ver ele [aqui](http://grupozap-code-challenge.s3-website-us-east-1.amazonaws.com/).

### As regras de negócio atuais são as seguintes

- Ele apenas é elegível pro portal ZAP:
  - Quando for aluguel e no mínimo o valor for de R$ 3.500,00.
  - Quando for venda e no mínimo o valor for de R$ 600.000,00.
- Ele apenas é elegível pro portal Viva Real:
  - Quando for aluguel e no máximo o valor for de R$ 4.000,00.
  - Quando for venda e no máximo o valor for de R$ 700.000,00.

#### Onde

```json
...
pricingInfos: {
  price: 200000, // Valor de venda
  rentalTotalPrice: 1200, // Valor de aluguel
  businessType: "RENTAL|SALE", // define se é aluguel ou venda
}
```

## O desafio

Bom, aqui é onde você entra! Precisamos que essa lógica seja abstraída da melhor maneira para o usuário. O código legado está lá para clarear as coisas, caso tenha ficado com alguma dúvida. No restante, ele não será usado para nada.

### O que vamos avaliar?

Para o desenvolvimento desse problema você pode utilizar alguma linguagem open source, framework ou lib em que se sinta confortável. De preferência uma das nossas principais linguagens:

Backend: **Java**, **NodeJS**, **Scala**, **Python** ou **Golang**. Frontend: **JavaScript**. Apps: **Swift** e **Kotlin**.

Iremos avaliar a sua solução pela:

- Organização
- Manutenibilidade
- Rastreabilidade
- Testabilidade
- Performance
- Portabilidade
- Entendimento do problema (sua interpretação, bem como seu entendimento a respeito das regras propostas também faz parte do teste, pois estamos avaliando a forma como você entende e resolve problemas)

Esperamos que ele seja **PRODUCTION READY**, então coloque todas as boas práticas que você estiver acostumado.

#### O que esperamos?

Existem 3 opções para realizar o desafio. Faça aquele que condiz com sua vaga.

### Opção A: Fazer uma interface de interação (frontend/apps)

**Reformule a camada de apresentação e visual** do [site legado](http://grupozap-code-challenge.s3-website-us-east-1.amazonaws.com/) da maneira que preferir, com alguns comportamentos **obrigatórios**:

- Quando se clicar em cima de um imóvel, deve apresentar uma tela de detalhe com as informações dele.
- Permitir a possibilidade do usuário navegar entre as fotos do imóvel na listagem e/ou detalhe.
- Paginação por 20 elementos.
- **Interface responsiva** (front) / **adaptável para telas diferentes** (apps).

A lógica (e [regras de negócio](https://grupozap.github.io/cultura/challenges/engineering.html#regras-de-neg%C3%B3cio-que-voc%C3%AA-precisa-implementar)) nesse caso ficará toda no front/app, então você vai trabalhar com todos dados **em memória**. O input deve ser acessado via request http (CORS friendly).

**Use sua criatividade** e aproveite das informações do imóvel para mostrar o card e o detalhe como você entende que seria a melhor forma e também a mais performática.

Você deverá usar como input o `source-1.json` (~400 registros):

- <http://grupozap-code-challenge.s3-website-us-east-1.amazonaws.com/sources/source-1.json>

---

### Opção B: Fazer uma API (backend)

Coloque essa lógica numa API backend, onde dada a **origem do portal** em uma request o seu response será a **listagem dos imóveis**. O routing da aplicação fica a seu gosto.

Assim como no front, é **obrigatório** trabalhar com toda manipulação dos dados **em memória**, então você precisará carregar o source em algum momento e fazendo **uma requisição HTTP** para uma das urls logo abaixo para obter os dados. Gostaríamos de verificar sua capacidade de escrever algoritmo, então _não é permitido usar qualquer tipo de database_. Utilizar uma interface com uma linguagem de query abstrai uma grande quantidade de complexidade e deixa o teste muito trivial. Portanto, não é permitido o uso de banco de dados, nem com persistência em disco, nem com persistência em memória.

O payload da _response_, além de conter a lista de imóveis com o contrato de output, **deve conter** os seguintes metadados de paginação e totais, implementar esses metadados é **obrigatório**:

```json
{
pageNumber: int32,
pageSize: int32,
totalCount: int32,
listings: [
    ...
]
}
```

Faça essa API pensando que ela pode ser consumida por vários tipos de clientes e com diferentes propósitos - portanto implemente o que mais achar relevante e que faça sentido.

Você deverá usar como source o `source-2` ou s`ource-2.json` (~10000 registros):

- <http://grupozap-code-challenge.s3-website-us-east-1.amazonaws.com/sources/source-2.json>
- <http://grupozap-code-challenge.s3-website-us-east-1.amazonaws.com/sources/source-2>

---

### Opção C: Fazer um processamento através de producer + consumer (backend)

Aqui você fará dois componentes:

- **Producer**: para ler todo o source e enviar para o _consumer_ via _TCP client_.
- **Consumer**: um TCP server ouvindo esse socket e escrevendo no arquivo `output-zap` (para imóveis elegíveis para o **ZAP**) e `output-viva` (para imóveis elegíveis para o **Viva Real**). O formato de cada linha dos arquivos de output é a mesma do _input_. A ordem dos dados não importa.

Considere _error handling_, _tracing_ apropriado, etc. Você decide em qual dos componentes irá implementar a lógica de validação.

Você deverá usar como input o `source-3` (~100000 registros):

- <http://grupozap-code-challenge.s3-website-us-east-1.amazonaws.com/sources/source-3>

---

## Regras de negócio que você precisa implementar

Agora com a fusão temos algumas alterações que precisam ser feitas. As seguintes regras precisam ser adicionadas às regras já existentes mencionadas no início deste texto:

- Um imóvel não é elegível em NENHUM PORTAL se:
  - Ele tem lat e lon iguais a 0.
- Caso o imóvel seja para venda, ele é elegível para o portal ZAP se:
  - O valor do metro quadrado (chave usableAreas) não pode ser menor/igual a R$ 3.500,00 - apenas considerando imóveis que tenham usableAreas acima de 0 (imóveis com usableAreas = 0 não são elegíveis).
  - Quando o imóvel estiver dentro do bounding box dos arredores do Grupo ZAP (descrito abaixo) considere a regra de valor mínimo (do imóvel) 10% menor.
- Caso o imóvel seja para aluguel, ele é elegível para o portal Viva Real se:
  - O valor do condomínio não pode ser maior/igual que 30% do valor do aluguel - apenas aplicado para imóveis que tenham um monthlyCondoFee válido e numérico (imóveis com monthlyCondoFee não numérico ou inválido não são elegíveis).
  - Quando o imóvel estiver dentro do bounding box dos arredores do Grupo ZAP (descrito abaixo) considere a regra de valor máximo (do aluguel do imóvel) 50% maior.

#### Onde

```json
{
  ...
  updatedAt: "2016-11-16T04:14:02Z", // data de atualização do imóvel
  address: {
    geolocation: {
      location: { // latitude/longitude do imóvel
        "lon": -46.716542,
        "lat": -23.502555
      },
    },
  },
  pricingInfos: {
    monthlyCondoFee: "495"
  }
}
```

### Bounding Box Grupo ZAP

```
minlon: -46.693419
minlat -23.568704
maxlon: -46.641146
maxlat: -23.546686
```

### Exemplo de contrato de input/output

Os JSON com dados estão minificados, então para facilitar seu desenvolvimento, aqui um exemplo dele pretty:

```json
[
  {
    "usableAreas": 69,
    "listingType": "USED",
    "createdAt": "2016-11-16T04:14:02Z",
    "listingStatus": "ACTIVE",
    "id": "some-id",
    "parkingSpaces": 1,
    "updatedAt": "2016-11-16T04:14:02Z",
    "owner": false,
    "images": [
      "https://resizedimgs.vivareal.com/crop/400x300/vr.images.sp/some-id1.jpg",
      "https://resizedimgs.vivareal.com/crop/400x300/vr.images.sp/some-id2.jpg",
      "https://resizedimgs.vivareal.com/crop/400x300/vr.images.sp/some-id3.jpg",
      "https://resizedimgs.vivareal.com/crop/400x300/vr.images.sp/some-id4.jpg",
      "https://resizedimgs.vivareal.com/crop/400x300/vr.images.sp/some-id5.jpg"
    ],
    "address": {
      "city": "",
      "neighborhood": "",
      "geoLocation": {
        "precision": "ROOFTOP",
        "location": {
          "lon": -46.716542,
          "lat": -23.502555
        }
      }
    },
    "bathrooms": 2,
    "bedrooms": 3,
    "pricingInfos": {
      "yearlyIptu": "0",
      "price": "405000",
      "businessType": "SALE",
      "monthlyCondoFee": "495"
    }
  },
  {
    "usableAreas": 70,
    "listingType": "USED",
    "createdAt": "2017-04-22T18:39:31.138Z",
    "listingStatus": "ACTIVE",
    "id": "some-id-2",
    "parkingSpaces": 1,
    "updatedAt": "2017-04-22T18:39:31.138Z",
    "owner": false,
    "images": [
      "https://resizedimgs.vivareal.com/crop/400x300/vr.images.sp/some-id-2-1.jpg",
      "https://resizedimgs.vivareal.com/crop/400x300/vr.images.sp/some-id-2-2.jpg",
      "https://resizedimgs.vivareal.com/crop/400x300/vr.images.sp/some-id-2-3.jpg",
      "https://resizedimgs.vivareal.com/crop/400x300/vr.images.sp/some-id-2-4.jpg",
      "https://resizedimgs.vivareal.com/crop/400x300/vr.images.sp/some-id-2-5.jpg"
    ],
    "address": {
      "city": "",
      "neighborhood": "",
      "geoLocation": {
        "precision": "ROOFTOP",
        "location": {
          "lon": -46.716542,
          "lat": -23.502555
        }
      }
    },
    "bathrooms": 1,
    "bedrooms": 2,
    "pricingInfos": {
      "yearlyIptu": "60",
      "price": "276000",
      "businessType": "SALE",
      "monthlyCondoFee": "0"
    }
  }
]
```

Caso você precise validar o input e não quer usar os sources inteiros, existem sources de exemplo:

- <http://grupozap-code-challenge.s3-website-us-east-1.amazonaws.com/sources/source-sample.json>
- <http://grupozap-code-challenge.s3-website-us-east-1.amazonaws.com/sources/source-sample>

## Prazo e como entregar

Esse desafio não deve tomar muito do seu tempo - a idéia dele é ser prático. Porém, vamos dar o prazo de **7 dias** a partir do momento que você o receber.

Para entregá-lo você deve criar um repositório **PRIVADO** no [GitHub](https://github.com/). Para facilitar a identificação do seu desafio, **nomeie seu repositório para** `eng-zap-challenge-{linguagem}` (ex: eng-zap-challenge-javascript). Fique ligado, repositórios públicos **não serão aceitos**!

Pedimos que você faça um _README_ com pelo menos instruções básicas como:

- como rodar localmente?
- como rodar os testes?
- como fazer o deploy?

**Prezamos muito por documentação em forma de README**, então faça dele seu cartão de visita.

Quando terminar o desafio, avisa pra gente! Libere o acesso para o usuário `***REMOVED***` e envie o link do seu repositório por e-mail para a pessoa responsável.

Bom teste!
