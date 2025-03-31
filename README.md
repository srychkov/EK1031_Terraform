# EK1031-Infrastructure-as-Code
**authors** Kacper Bohaczyk , Sergej Rychkov


## Aufgabenbeschreibung
Bearbeitung des AWS-Tutorials [1]

## Umsetzung


AWS configure zum setzten:

kacper@kacper-Lenovo-Legion-5-15IMH05H:~/Desktop/SYT_1031_EK/learn-terraform-aws-instance$ aws configure
AWS Access Key ID [****************Q4FR]: 
AWS Secret Access Key [****************m4Cm]: 
Default region name [eu-north-1]: 
Default output format [None]: aws_instance.web[*].public_ipS


### EKv - Automatisiertes Deployment von drei virtuellen Maschinen in AWS

*Zielsetzung*
> Automatisches Erstellen von 3 virtuellen Maschinen (VMs) in AWS mithilfe von Terraform – ohne manuelle Nutzung der AWS-Weboberfläche.

- Spart Zeit, ist wiederholbar (idempotent) und nachvollziehbar.

### Voraussetzungen
- *AWS-Konto* → Zugang zur [AWS-Konsole](https://aws.amazon.com/console)
- *IAM-Benutzer mit Zugriffsschlüssel*  
    → Erstellen eines Zugriffsschlüssels (Access Key + Secret Key)  
    → [IAM-Zugriffsschlüssel generieren](https://docs.aws.amazon.com/de_de/IAM/latest/UserGuide/id_credentials_access-keys.html)
- *Terraform lokal installieren* → Anleitung: Terraform Install Guide
- *AWS CLI (optional)* → Nützlich für Tests oder direkten Zugriff auf die AWS API

### Projektstruktur
```css
learn-terraform-aws-instance/
│
├── provider.tf
├── variables.tf
├── main.tf
├── outputs.tf

```
- **provider.tf**
Definiert, *wo* die Infrastruktur erstellt wird.  
    - Terraform benötigt diese Informationen, um sich mit dem richtigen Cloud-Anbieter und Benutzer zu verbinden.  
→ In diesem Fall: AWS, Region *eu-central-1* (Frankfurt).

- **variables.tf**
Hier werden *Variablen* definiert (z. B. Anzahl der VMs, Typ, Betriebssystem).  
    - Variablen ermöglichen Wiederverwendbarkeit und Anpassbarkeit, ohne den Code direkt ändern zu müssen.

- **main.tf**
Definiert, *welche Ressourcen* konkret erstellt werden.  
     - Beispiel: „Erstelle count = 3 EC2-Instanzen mit einer bestimmten AMI-ID (z. B. Ubuntu) und einer definierten Größe (z. B. t2.micro).“

- **outputs.tf**
Hier werden am Ende wichtige Informationen wie die IP-Adressen der erstellten Server ausgegeben.  
    - Ermöglicht z. B. die automatische Anzeige von SSH-Verbindungsdetails oder URLs zur weiteren Nutzung.

### Wichtige Terraform-Befehle

- terraform init → Terraform lädt alle notwendigen Plugins (z. B. für AWS) und bereitet das Projekt vor.
- terraform plan → Zeigt an, welche Änderungen Terraform vornehmen würde, bevor etwas ausgeführt wird.
- terraform apply → Führt den geplanten Code aus und erstellt die Infrastruktur in AWS (in diesem Fall 3 VMs).
- terraform destroy → Löscht alle erstellten Ressourcen.

### Konfiguration in AWS
Unter *IAM > Users > "xyz"-Benutzer*  
- Dem Benutzer die *AmazonEC2FullAccess*-Berechtigung zuweisen.

## Bewertung

### Erweiterte Anforderungen *überwiegend erfüllt*
- [x] Installation und Funktionstest von Terraform in einer VM

### Erweiterte Anforderungen *vollständig erfüllt*
- [x] Deployment von drei virtuellen Maschinen in der Cloud

## Quellen
* [1] [Terraform Tutorials](https://developer.hashicorp.com/terraform/tutorials)
* [2] https://spacelift.io/blog/terraform-files
* [3] https://docs.aws.amazon.com/prescriptive-guidance/latest/terraform-aws-provider-best-practices/structure.html
* [4] https://developer.hashicorp.com/terraform/cli/commands
* [5] https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html