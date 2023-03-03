$folder = "C:\Users\ikhela\Pictures\"

# $imageFiles = Get-childItem -Path $folfer -Filter *.jpg,*.png
$imageFiles = Get-childItem -path $folder | Where-Object{$_.Extension -eq "*.jpg" -or $_.Extension -eq ".png" }

#Tant que le script est en cours d'exécution 
while($true){
  write-host "en cours...."
  Start-Sleep -Seconds 60s

  #choisir le fichier aléatoire à partir du fichier 
  $image = $imageFiles | Get-Random 
  write-host(test-path $image.FullName)

  #Definir l'image d'arrière-plan 
  Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop' -Name 'Walpaper' -Value $image.FullName

  #Mettre à jour les paramètres du bureau 
  rundll32.exe user32.dll, UpdatePerUserSystemParameters
  
  #UpdatePerUserSystemParameters: est utilisé pour mettre à jour lesinformations spécifique de l'utilisateur 
  
  #l'appel de cette fonction modifie les éléments enregistré dans HKCU:\Control Panel\Desktop\ comme l'image d'arrière plan

  #après la mise à jour la fonction envoie un message au gestionnaire de fenêtre de windows pour lui indiquer de rafrâchir l'affichage du bureau avec les nouveaux paramètre 



  #Attendre une heure avant de changer l'image d'arrière-plan 
  }




