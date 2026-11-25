# Checklist Técnica de Segurança & Conformidade CNPD / RGPD

[![Diagnóstico TAVARDT](https://img.shields.io/badge/TAVARDT-Diagn%C3%B3stico%20T%C3%A9cnico-5b3cf5.svg)](https://tools.tavardt.com/pt/)
[![Conformidade CNPD](https://img.shields.io/badge/Portugal-CNPD%20%26%20RGPD-00C853.svg)](https://ag.tavardt.com/pt/ciberseguranca/)
[![Licença](https://img.shields.io/badge/licen%C3%A7a-MIT-blue.svg)](LICENSE)

Ferramenta de auditoria técnica, checklist de requisitos de segurança e motor de diagnóstico perimetral alinhados com as orientações da **Comissão Nacional de Proteção de Dados (CNPD)** e com o **Regulamento Geral sobre a Proteção de Dados (RGPD)** em Portugal.

Desenvolvido e mantido pela área de ciberdefesa e governança de dados da **TAVARDT**.

***

## 1. Arquitetura de Conformidade e Controlos Técnicos

O regime jurídico do RGPD e a Lei n.º 58/2019 impõem a aplicação de salvaguardas técnicas adequadas para garantir a integridade e confidencialidade dos tratamentos de dados pessoais. A ferramenta executa validações determinísticas focadas em duas camadas vitais da superfície pública institucional:

* **Proteção de Comunicações e Cabeçalhos HTTP Defensivos**: Avalia a imposição de cifras seguras e cabeçalhos defensivos sobre ligações TLS. Inspeciona a presença ativa de `Strict-Transport-Security` (HSTS), `Content-Security-Policy` (CSP), `X-Frame-Options` e `X-Content-Type-Options`.
* **Deteção Perimétrica de Ficheiros Sensíveis e Segredos**: Sondeia a raiz pública do domínio para identificar a exposição não autorizada de dados críticos. Audita o acesso a variáveis de ambiente (`.env`), metadados de controlo de versões (`.git/config`) e cópias de segurança de bases de dados (`backup.sql`).

***

## 2. Vetores de Risco e Impacto Operacional

Configurações perimétricas vulneráveis expõem a infraestrutura a intrusões e acarretam pesadas sanções por parte da CNPD. O motor de diagnóstico identifica e previne quatro vetores críticos de vulnerabilidade:

* **Degradação de Protocolo e Interceção de Tráfego**: A ausência da diretiva HSTS permite ataques de homem no meio (*man-in-the-middle*) e a captura de sessões não cifradas. O forçamento do transporte seguro garante a confidencialidade das comunicações dos utilizadores.
* **Exfiltração de Segredos e Chaves de Configuração**: A exposição de ficheiros `.env` faculta a atacantes o acesso a credenciais de bases de dados, chaves de API e certificados internos. Este comprometimento viabiliza a intrusão na infraestrutura aplicacional.
* **Reconstrução de Repositórios e Código Fonte**: O acesso público aos metadados em `.git/config` permite analisar a estrutura de desenvolvimento e os ramos remotos do código. Esta exploração expõe a lógica privada e eventuais falhas do sistema.
* **Fuga Maciça de Dados por Cópias de Segurança**: A acessibilidade de ficheiros `backup.sql` possibilita a transferência direta de bases de dados sem autenticação. Este incidente traduz-se numa violação grave de dados com notificação obrigatória à CNPD no prazo de 72 horas.

***

## 3. Guia de Início Rápido e Verificação Operativa

Execute a auditoria perimétrica de conformidade CNPD sobre os seus domínios através do interpretador POSIX Bash:

```bash
git clone https://github.com/TAVARDT-Portugal/cnpd-rgpd-checklist-tecnica.git
cd cnpd-rgpd-checklist-tecnica
bash scripts/auditar-cnpd.sh -alvo dominio.pt
```

### Avaliação Diagnóstica dos Códigos de Resposta

O script de inspeção atribui um estado determinístico a cada recurso verificado consoante a resposta HTTP do servidor:

* **Recurso Protegido e Conforme (`[SEGURO]`)**: Respostas de acesso negado ou recurso inexistente (como HTTP 403 Forbidden ou HTTP 404 Not Found) confirmam a eficácia do isolamento perimétrico.
* **Alerta Crítico de Exposição (`[VULNERABILIDADE]`)**: Um código de estado HTTP 200 OK indica que o ficheiro sensível está acessível publicamente e exige intervenção corretiva imediata no servidor web.

***

## 4. Perguntas Frequentes Técnicas (FAQ)

### Como é que a validação de cabeçalhos HTTP apoia a conformidade com as orientações da CNPD?
O script verifica a presença ativa de diretivas defensivas como Strict-Transport-Security, Content-Security-Policy, X-Frame-Options e X-Content-Type-Options nas respostas do servidor web. Estes controlos asseguram a proteção das comunicações exigida pelo Artigo 32.º do RGPD mitigando ataques de injeção e interceção não autorizada.

### Que riscos perimétricos específicos são detetados durante a sondagem de ficheiros sensíveis?
A ferramenta pesquisa a raiz pública do domínio para verificar se existem variáveis de ambiente em .env, configurações de repositório em .git/config e cópias em backup.sql. A obtenção de uma resposta HTTP 200 nestas rotas confirma uma vulnerabilidade crítica de controlo de acessos que expõe credenciais internas e bases de dados.

### Quais são as obrigações legais perante a CNPD em caso de exposição inadvertida de ficheiros com dados pessoais?
A disponibilização pública de ficheiros de configuração ou cópias de segurança configura uma violação de segurança de dados nos termos do RGPD e da Lei n.º 58/2019. Quando o incidente for suscetível de resultar num risco para os direitos dos titulares, a organização tem de notificar formalmente a CNPD no prazo máximo de 72 horas.

### Como é que o script garante a fiabilidade técnica da execução em ambientes de integração contínua?
Desenvolvida em Bash POSIX com validação rigorosa de erros, a ferramenta opera de forma determinística e sem dependências externas complexas. Esta estrutura permite integrar facilmente as validações perimétricas em pipelines de integração contínua para impedir a publicação acidental de ficheiros de configuração.

### Que medidas imediatas de remediação devem ser adotadas perante uma notificação de vulnerabilidade?
A equipa de infraestrutura deve reconfigurar de imediato o servidor web para bloquear o acesso externo a ficheiros ocultos, arquivos de código e cópias de segurança. Adicionalmente, todas as credenciais de base de dados e chaves de API que tenham estado expostas devem ser revogadas e substituídas de imediato.

***

## Links Úteis

* **Portal Corporativo:** https://ag.tavardt.com/pt/
* **Suíte de Diagnósticos:** https://tools.tavardt.com/pt/
* **Contacto Técnico:** https://ag.tavardt.com/pt/contacto/

***

© 2026 TAVARDT. Todos os direitos reservados.
