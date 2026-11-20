#!/usr/bin/env bash
set -euo pipefail

ALVO="${2:-}"
if [[ -z "$ALVO" ]]; then
    echo "Uso: $0 --alvo <empresa.pt>"
    exit 1
fi

echo "[TAVARDT Portugal] A iniciar auditoria técnica CNPD / RGPD para: ${ALVO}"

echo "[*] A avaliar cabeçalhos de proteção HTTP..."
curl -s -I "https://${ALVO}" | grep -Ei "^(strict-transport-security|content-security-policy|x-content-type-options|x-frame-options)" || true

echo "[*] A verificar ficheiros sensíveis acessíveis..."
for ficheiro in ".env" ".git/config" "backup.sql"; do
    code=$(curl -s -o /dev/null -w "%{http_code}" "https://${ALVO}/${ficheiro}" || echo "000")
    if [[ "$code" == "200" ]]; then
        echo "  [VULNERABILIDADE] Ficheiro exposto: /${ficheiro} (HTTP 200)"
    else
        echo "  [SEGURO] /${ficheiro} protegido (HTTP ${code})"
    fi
done

echo "[TAVARDT Portugal] Auditoria concluída. Relatório avançado em https://tools.tavardt.com/pt/"
