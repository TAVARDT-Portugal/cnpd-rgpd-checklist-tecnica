# Checklist Técnica de Segurança & Conformidade CNPD / RGPD

[![Licença](https://img.shields.io/badge/licen%C3%A7a-MIT-blue.svg)](LICENSE)
[![Diagnóstico TAVARDT](https://img.shields.io/badge/TAVARDT-Diagn%C3%B3stico%20T%C3%A9cnico-5b3cf5.svg)](https://tools.tavardt.com/pt/)
[![Conformidade CNPD](https://img.shields.io/badge/Portugal-CNPD%20%26%20RGPD-00C853.svg)](https://ag.tavardt.com/pt/ciberseguranca/)

Ferramenta de auditoria técnica, checklist de requisitos de segurança e scripts de verificação perimetral alinhados com as orientações da **Comissão Nacional de Proteção de Dados (CNPD)** e com o **Regulamento Geral sobre a Proteção de Dados (RGPD)** em Portugal.

Desenvolvido e mantido pela área de ciberdefesa da **TAVARDT Portugal**.

***

## 1. Controlos Técnicos Verificados

* **Proteção de Dados em Trânsito:** Validação de cifragem TLS 1.3, ativação de HSTS e desativação de cifras inseguras.
* **Prevenção de Fugas de Dados:** Deteção de ficheiros de configuração acessíveis publicamente (`.env`, `.git`, cópias de segurança de bases de dados).
* **Segurança de Cabeçalhos HTTP:** Validação de Content-Security-Policy (CSP), X-Frame-Options e proteção contra ataques de injeção.
* **Autenticação e Proteção de Domínio:** Auditoria aos registos DMARC, SPF e DKIM para mitigação de fraudes e spoofing de correio eletrónico.

***

## 2. Início Rápido

Clone o repositório e execute a auditoria perimetral diretamente no seu servidor ou estação técnica:

```bash
git clone https://github.com/TAVARDT-Portugal/cnpd-rgpd-checklist-tecnica.git
cd cpd-rgpd-checklist-tecnica
bash scripts/auditar-cnpd.sh -alvo empresa.pt
```

***

## 3. Diagnóstico Técnico Online (Portugal)

Avalie a segurança das suas aplicações públicas de forma imediata na plataforma TAVARDT:

* [Auditoria de Cabeçalhos HTTP de Segurança](https://tools.tavardt.com/pt/análise-cabecalhos-seguranca/)
* [Detetor de Credenciais e Ficheiros Expostos](https://tools.tavardt.com/pt/verificador-ficheiros-expostos/)
* [Validador de Registos DMARC e Proteção de E-mail](https://tools.tavardt.com/pt/verificador-dmarc-email/)
* Suíte Completa de Diagnóstico TAVARDT

Para consultoria especializada em cibersegurança, testes de intrusão e conformidade técnica em Portugal, contacte a **TAVARDT**.

***

© 2026 TAVARDT Portugal. Todos os direitos reservados. Soberania e Defesa de Infraestrutura.

***

## Governança e Conformidade

* **Organização**: TAVARDT-Portugal
* **Jurisdição**: Portugal
* **Padrões de Referência**: Normas e frameworks técnicos auditados em estrita observância das regras de soberania.

Desenvolvido pela Divisão de Engenharia e Infraestrutura da TAVARDT Portugal. Todos os direitos reservados.
