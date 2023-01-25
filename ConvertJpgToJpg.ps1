# ceci est un script qui permet de convertir un fichier jpg en jpeg tout en utilisant la technologie ChatGpt
# Définir le répertoire contenant les fichiers JPG

# Charger l'assembly System.Drawing
Add-Type -Assembly System.Drawing

$folder = "E:\IDA 2\Koffi Kan Marc\"

# Obtenir tous les fichiers JPG dans le répertoire
$files = Get-ChildItem -Path $folder -Filter "*.jpg" 

# Boucle pour convertir chaque fichier
foreach ($file in $files) {
    # Obtenir le chemin complet du fichier
    $filePath = $folder + $file

    # Charger l'image
    $image =[System.Drawing.Image]::FromFile($filePath)

    # Définir le nouveau nom de fichier
    $newFile = $file.BaseName + ".jpeg"

    # Enregistrer l'image au format JPEG 
    $image.Save($folder + $newFile, [System.Drawing.Imaging.ImageFormat]::Jpeg)

    # Afficher un message indiquant que le fichier a été converti
    Write-Host "Le fichier $file a été converti en $newFile"
     
    if (Test-Path $newFile){
        write-host "re"
        remove-item -recurse $file
        write-host "Le fichier $file a été supprimé"
    }
}
