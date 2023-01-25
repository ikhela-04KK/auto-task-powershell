# ceci est un script qui permet de convertir un fichier jpg en jpeg tout en utilisant la technologie ChatGpt
# Définir le répertoire contenant les fichiers JPG

#!Exception lors de l'appel de «FromFile» avec «1» argument(s): «Mémoire insuffisante.

# Charger l'assembly System.Drawing
Add-Type -Assembly System.Drawing

# link folder where you stock your images
$folder = "C:\Users\ikhela\IDA 2\"

#listes des nouveaux fichiers créés


# Obtenir tous les fichiers JPG dans le répertoire
$files = Get-ChildItem -Path $folder -Filter "*.jpg" -recurse

# Boucle pour convertir chaque fichier



foreach ($file in $files) {
    # $list_new_file = @()
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
    
    #marquer un temps d'arrêt
    Start-Sleep -Seconds 2
    # stop-process

    $image.Dispose()
    Remove-Item $filePath -Force

    #creation d'un tableau et ajouter les nouveaux fichiers crées
    # $list_new_file.add($newFile)
}


# creer une nouvelle liste de nouveau élément dès que la liste est crée je vient boucler sur les éléments afin de supprimer 
# forEach($list_new_file in $newFile){
    #  if (Test-Path $newFile){
        #  $file_delete =$newFile.FullName.Replace(".jpg", ".jpeg")
        #  Remove-Item -Force $file_delete
    #  }
# }
    #  
# 