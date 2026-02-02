```bash
export CR_PAT={{ pat token }}
echo $CR_PAT | helm registry login ghcr.io -u taedi90 --password-stdin
helm package helmet-extended
helm push helmet-extended-{{ version }}.tgz oci://ghcr.io/taedi90 
```