Add-Type -AssemblyName System.IO.Compression.FileSystem
function Download-FileIfNotExist {
  param (
    [string]$url,
    [string]$filePath
  )

  $baseDownloadPath = "source_codes"
  if (-not (Test-Path -Path $baseDownloadPath)) {
    New-Item -ItemType Directory -Path $baseDownloadPath
  }

  $filePath = Join-Path -Path $baseDownloadPath -ChildPath $filePath

  if (Test-Path -Path $filePath) {
    Write-Host "The file $filePath already exists."
  }
  else {
    Write-Host "Downloading $filePath..."
    Invoke-WebRequest -Uri $url -OutFile $filePath
    Write-Host "Download completed."
  }
}

function Expand-ArchiveFile {
  param (
    [string]$filePath
  )

  $baseDownloadPath2 = "source_codes"
  $filePath = Join-Path -Path $baseDownloadPath2 -ChildPath $filePath
  Write-Host $filePath
  $zipArchive = [System.IO.Compression.ZipFile]::OpenRead($filePath)
  try {
    $firstEntry = $zipArchive.Entries[0]
    Write-Host  $firstEntry 

  }
  finally {
    # ZipArchive 객체를 닫습니다.
    $zipArchive.Dispose()
  }

  $firstEntry = Join-Path -Path $baseDownloadPath2 -ChildPath $firstEntry

  if (Test-Path -Path $firstEntry) {
    Write-Host "The file $firstEntry already exists. stop expanding"
    return
  }
  else {
    Write-Host "Expanding ZIP archive $filePath..."
    Expand-Archive -LiteralPath $filePath -DestinationPath "./source_codes"
    Write-Host "ZIP archive expanded."
  }

}
"####################################################################"
"###################### TBB #########################################"
$name = "tbb"
$url = "https://github.com/oneapi-src/oneTBB/archive/refs/tags/v2021.11.0-rc1.zip"
$type = ".zip"
$zipfile = ($name + $type)
Download-FileIfNotExist -url $url -filePath $zipfile
Expand-ArchiveFile -filePath $zipfile

"####################################################################"
"###################### boost #########################################"
$filePath = ".\source_codes\boost-1.78.0"
if (Test-Path -Path $filePath) {
  Write-Host "The file $filePath already exists."
}
else {
  Write-Host "Downloading $filePath... by git clone"
  git clone  "https://github.com/boostorg/boost.git" $filePath
  cd $filePath
  git checkout "boost-1.78.0"
  git submodule update --init --recursive
  cd "..\.."
  Write-Host "Download completed."
}

# "####################################################################"
# "###################### eigen #########################################"
# $name = "eigen"
# $url = "https://gitlab.com/libeigen/eigen/-/archive/3.3.7/eigen-3.3.7.zip"
# $type = ".zip"
# $zipfile = ($name + $type)
# Download-FileIfNotExist -url $url -filePath $zipfile
# Expand-ArchiveFile -filePath $zipfile

"####################################################################"
"###################### eigen #########################################"
$name = "eigen34"
$url = "https://gitlab.com/libeigen/eigen/-/archive/3.4.0/eigen-3.4.0.zip"
$type = ".zip"
$zipfile = ($name + $type)
Download-FileIfNotExist -url $url -filePath $zipfile
Expand-ArchiveFile -filePath $zipfile

"####################################################################"
"###################### gflags #########################################"
$name = "gflags"
$url = "https://github.com/gflags/gflags/archive/refs/tags/v2.2.2.zip"
$type = ".zip"
$zipfile = ($name + $type)
Download-FileIfNotExist -url $url -filePath $zipfile
Expand-ArchiveFile -filePath $zipfile

"####################################################################"
"###################### glog #########################################"
$name = "glog"
$url = "https://github.com/google/glog/archive/refs/tags/v0.6.0.zip"
$type = ".zip"
$zipfile = ($name + $type)
Download-FileIfNotExist -url $url -filePath $zipfile
Expand-ArchiveFile -filePath $zipfile


"####################################################################"
"###################### ceres #########################################"
$name = "ceres"
$url = "https://github.com/ceres-solver/ceres-solver/archive/refs/tags/2.2.0.zip"
$type = ".zip"
$zipfile = ($name + $type)
Download-FileIfNotExist -url $url -filePath $zipfile
Expand-ArchiveFile -filePath $zipfile

"####################################################################"
"###################### gtsam #########################################"

$filePath = ".\source_codes\gtsam-ba23e45"
if (Test-Path -Path $filePath) {
  Write-Host "The file $filePath already exists."
}
else {
  Write-Host "Downloading $filePath... by git clone"
  git clone  "https://github.com/borglab/gtsam.git"  $filePath
  cd $filePath
  git checkout "boost-1.78.0"
  git submodule update --init --recursive
  cd "..\.."
  Write-Host "Download completed."
}
"####################################################################"
"########################### json ###################################"
$name = "json"
$url = "https://github.com/nlohmann/json/archive/refs/tags/v3.11.2.zip"
$type = ".zip"
$zipfile = ($name + $type)
Download-FileIfNotExist -url $url -filePath $zipfile
Expand-ArchiveFile -filePath $zipfile

"####################################################################"
"########################### opencvcontriv3420  #####################"
$name = "opencvcontriv420"
$url = "https://github.com/opencv/opencv_contrib/archive/refs/tags/3.4.20.zip"
$type = ".zip"
$zipfile = ($name + $type)
Download-FileIfNotExist -url $url -filePath $zipfile
Expand-ArchiveFile -filePath $zipfile

"####################################################################"
"########################### opencv3420 #############################"
$name = "opencv3420"
$url = "https://github.com/opencv/opencv/archive/refs/tags/3.4.20.zip"
$type = ".zip"
$zipfile = ($name + $type)
Download-FileIfNotExist -url $url -filePath $zipfile
Expand-ArchiveFile -filePath $zipfile

"####################################################################"
"########################### spdlog ###################################"
$name = "spdlog"
$url = "https://github.com/gabime/spdlog/archive/refs/tags/v1.12.0.zip"
$type = ".zip"
$zipfile = ($name + $type)
Download-FileIfNotExist -url $url -filePath $zipfile
Expand-ArchiveFile -filePath $zipfile

# "####################################################################"
# "###########################  ###################################"
# $name = ""
# $url = ""
# $type = ".zip"
# $zipfile = ($name + $type)
# Download-FileIfNotExist -url $url -filePath $zipfile
# Expand-ArchiveFile -filePath $zipfile
