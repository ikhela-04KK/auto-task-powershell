#? PREMIRE PARTIE 

#* listes des extensions d'images qui existent 
$image_extensions = @("JPEG","JPG","PNG","SVG")

#* Parcourir les dossiers et verifer s'il y'a des images
$folders = Get-ChildItem -recurse -Directory

ForEach($folders in $folder){
    #* specfique extensions d'image
    $file_v = (Get-Item $(Get-ChildItem $folder -Filter "*.JPEG"))
    if ($file_v.Extension -in $image_extensions){
        Write-Host "$folder contient une image"
        Write-Host "Image est $file_v.Name"
    }
    else{
        #* s'il n' y a pas d'image il faut afficher le dossier le lien du fichier ou il n'y a pas d'image
        Write-Host "$folder contient pas d'image"
    }
}
 
#? DEUXIEME PARTIE 
    #* S'il n' y des images qui ne sont pas dans un format jpeg , il faut que tu les convertissent 
    #* s'il y ' a une image au format specifier , il faut que tu passe 

#? TROISIEME PARTIE
    #* Utiliser les methodes asynchrone pour aller encore plus rapidement 
    #* utiliser les methodes de gestions de memoires comme illustrer de l'autre côté pour les imgages 

