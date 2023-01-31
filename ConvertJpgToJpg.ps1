# ceci est un script qui permet de convertir un fichier jpg en jpeg tout en utilisant la technologie ChatGpt
# Définir le répertoire contenant les fichiers JPG
 

#!Exception lors de l'appel de «FromFile» avec «1» argument(s): «Mémoire insuffisante.
#! le problèm epeut se trouver dans les dossiers 
#met en silience toutes les erreurs dans mon code
# $ErrorActionPreference = "SilentlyContinue" 

# Charger l'assembly System.Drawing
[System.Reflection.Assembly]::LoadWithPartialName('System.Drawing')

# link folder where you stock your images
$folder = "C:\Users\ikhela\Downloads\convert_folder\"

#listes des nouveaux fichiers créés


# Obtenir tous les fichiers JPG dans le répertoire
$files = Get-ChildItem -Path $folder
Write-Host "$files"
# Boucle pour convertir chaque fichier

foreach ($file in $files) {
    # $list_new_file = @()
    # Obtenir le chemin complet du fichier
    $filePath = $folder + $file
    Write-Host "$file"
    # Charger l'image
    $image =[System.Drawing.Image]::FromFile($filePath)
    Write-Host "$image"
    # Définir le nouveau nom de fichier
    $newFile = $file.BaseName + ".jpeg"
    Write-Host "$newFile"    
    $newFileJpeg = $folder + $newFile
    write-Host "$newFileJpeg"
    # Enregistrer l'image au format JPEG 
    $Jpeg = [System.Drawing.Imaging.ImageFormat]::Jpeg
    $image.Save($newFileJpeg, $Jpeg)
    
    # Message de verification
    if(Test-Path $newFileJpeg ){
        Write-Host "Le fichier $file a été converti en $newFile"
    }
    else{
        Write-Host "Le fichier $file n'a pas été converti en Jpeg"
    }    
    
    Start-Sleep -Seconds 2 #marquer un temps d'arrêt
    $image.Dispose() #permet de liberer les ressources qui ont été utilisé par conversion d'image

    
    
    # Remove-Item $filePath -Force

    #creation d'un tableau et ajouter les nouveaux fichiers crées
    # $list_new_file.add($newFile)
}
