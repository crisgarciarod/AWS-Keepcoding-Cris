# PRÁCTICA FINAL DE AWS   

El objetivo de la práctica es generar una plantilla de Terraform que despliegue un Website Estático en un Bucket S3 en Irlanda y tambien generar un output  de Terraform con el endopoint de conexión.

## Clonado del repositorio

Para el clonado del repositorio solo es necesario realizarlo de la siguiente manera:

- git clone `git@github.com:KeepCodingCloudDevops6/AWS-Crisgarcia.git` o bien,
- git clone `https://github.com/KeepCodingCloudDevops6/AWS-Crisgarcia.git`


## Contenido del repositorio

A continuación se especificará lo que contiene los siguientes archivos:

- En `main.tf` se encuentra la configuración principal.
- En `variables.tf` contiene las definiciones de las variables de  entrada para proporcionar una mejor legibilidad y organización.
- En `variables.tfvars` se encuentra las especificaciones de las variables.
- En `output.tf` se encuentra el endpoint de la conexión.

## Ejecutar Terraform

- Para poder ejecutar el despliegue se deben de seguir los siguientes pasos:

    - Para inicializar la configuración de Terraform:

        `
        terraform init
        `
    
    - Para crear el plan de ejecución:

        `
        terraform plan -var-file=variables.tfvars
        `

    - Para aplicar los cambios necesarios para alcanzar el estado deseado de la configuración, o el conjunto predefinido de acciones generado por un plan ejecución: 

         `
        terraform apply -var-file=variables.tfvars
        `

        En esta momento, ya se nos ha tenido que generar todo el website Estatico en nuestra cuenta de `AWS`.

    - Para destruir toda la configuración que hemos generado: 

        `
        terraform destroy
        `
        
Siguiendo todos estos pasos, no tendríamos problemas para poder levantar el Website Estático.

##  Acceso al bucket

- Dentro del `main.tf` se puede ver como el acceso público depende de la variable `policy_enabled`. Es decir, en el caso en que la variable sea true, las ACLs del bucket y los objetos que hay dentro son privados, y el acceso publico se habilita a través de una policy. En cambio, si el valor de la variable es false, el acceso se realiza a través de ACLs y no se crea la policy.



### Cristina Garcia Rodriguez (crisgarciarodriguez04@gmail.com)