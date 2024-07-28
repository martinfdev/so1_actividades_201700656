# Actividad 2


Tiene que existir la variable de entorno GITHUB_USER con el nombre de usuario de github.

### Comando de cronjobs en segudo plano para ejecutar script cada 5 minutos
```bash
    nohup watch -n 300 ./script.sh > /dev/null 2>&1 &
```