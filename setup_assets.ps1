$dirs = @(
    'assets/images/arihant/logo',
    'assets/images/arihant/banner',
    'assets/images/arihant/amenities',
    'assets/images/arihant/gallery'
)

foreach ($d in $dirs) {
    if (-not (Test-Path $d)) {
        New-Item -ItemType Directory -Path $d -Force | Out-Null
    }
}

$images = @(
    @{url='https://thexghatkopar.in/public/admin/images/The-X-ghatkopar-Logo-09032025131050.png'; path='assets/images/arihant/logo/logo.png'},
    @{url='https://thexghatkopar.in/public/admin/images/1741525528.jpg'; path='assets/images/arihant/banner/banner1.jpg'},
    @{url='https://thexghatkopar.in/public/admin/images/image1741525510.jpg'; path='assets/images/arihant/banner/banner2.jpg'},
    @{url='https://thexghatkopar.in/public/admin/images/The-X-Ghatkopar-Conference-09032025043657.jpg'; path='assets/images/arihant/amenities/conference.jpg'},
    @{url='https://thexghatkopar.in/public/admin/images/The-X-Ghatkopar-Internal%20(2)-09032025043713.jpg'; path='assets/images/arihant/amenities/lobby.jpg'},
    @{url='https://thexghatkopar.in/public/admin/images/The-X-Ghatkopar-Office-Space-09032025043729.jpg'; path='assets/images/arihant/amenities/office_space.jpg'},
    @{url='https://thexghatkopar.in/public/admin/images/The-X-Ghatkopar-Elevation-09032025130603.jpg'; path='assets/images/arihant/gallery/elevation.jpg'},
    @{url='https://thexghatkopar.in/public/admin/images/The-X-Ghatkopar-Master-Layout-Plan_-08032025144050.jpg'; path='assets/images/arihant/gallery/master_plan.jpg'},
    @{url='https://thexghatkopar.in/public/admin/images/The-X-Ghatkopar-Office-Space%20(2)-09032025043740.jpg'; path='assets/images/arihant/gallery/office_view.jpg'}
)

foreach ($img in $images) {
    Write-Host "Downloading $($img.url) to $($img.path)"
    try {
        Invoke-WebRequest -Uri $img.url -OutFile $img.path -UseBasicParsing -ErrorAction Stop
    } catch {
        Write-Warning "Failed to download $($img.url). Error: $_"
    }
}

Write-Host 'Task complete.'
