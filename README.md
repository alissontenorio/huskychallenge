# README

Instruções:

- Copie .env para a pasta principal
- Copie master.key para pasta /config
- docker-compose up
- Acesse http://127.0.0.1:3000/ e rode as pending migrations
- Pode acessar o sistema na url acima

Funcionalidades desenvolvidas:

- Gerar token de acesso
- Login via token
- Listar invoices
- Visualizar invoice
- Criar e enviar invoice
- Logout

Funcionalidades fora do escopo:
- Filtros de invoice: número da invoice, data
- Login via api
- Testes
- u-case

Racional do que foi feito, principais pontos:
- Utilizei a Sidekiq em detrimentos de outros frameworks. Por experiência vejo ela como mais confiável.  
- Optei por Postgres por ser um banco open source, grátis, robusto e eficiente.
- Para pdf's havia optado pela gem pdfkit, mas depois de testar a gem wicked_pdf resolvi optar por esta última pela facilidade maior na hora de renderizar.
- Procurei reduzir o problema das querias n+1 nas invoices incluindo a invoices email
- Busquei deixar as entidades no banco normalizadas
- No login eu optei pela gem Sorcery por já possuir uma estrutura de token's de ativação. Acabei deixando a nomenclatura existente e não busquei mudar nomes. O meu workaround foi simplesmente não rodar o activate
(o que apagaria o token), mas ainda assim utilizar toda a estrutura da biblioteca, até mesmo o login. 
- O email de ativação é enfileirado no sidekiq assim que o usuário é criado (essa configuração se encontra em
initializer/sorcery.rb). Já o de envio de invoice é chamado normalmente no controller.
- Procurei deixar o máximo possível em PORO's com o tempo que eu possuía
- Para adicionar mais de um email na lista de invoices eu optei por Vanilla.js porque eu gosto de baunilha =)

Futuras melhorias:
- Colocar o envio de email de invoice para ser enviado ao criar, conforme descrito no requisito.
- Avaliar a separação da renderização do download de pdf e do invoice_mailer em um PORO
- Melhorar nomenclatura das actions de login controller
- Implantar bootstrap
- Retirar senhas do .env e colocar no rails credentials
- Criar validações para o form e nos campos do model de Invoice
- Modularizar melhor os domínios

Stack:

* Sidekiq
* Postgres
* Redis
