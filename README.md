# Image-Segmentation
Working with [@JimenaGonzalez](https://github.com/JimenaGonzalez) to use image segmentation for automated `lenstronomy` lens modeling.

## Procedure:
![flowchart](https://github.com/gilliancartwright/Image-Segmentation/assets/106614337/15f25628-6429-4afe-82c5-b1b72b91bb51)

* Step 1: [Simulate lens systems](https://github.com/JimenaGonzalez/Simulations-Double-Source-Gravitational-Lensing) ([@JimenaGonzalez](https://github.com/JimenaGonzalez))
* Step 2: [Find lens candidates](https://github.com/JimenaGonzalez/Searching-double-lenses) (González, in prep.)
* Step 3: [Create training set](https://github.com/gilliancartwright/Image-Segmentation/blob/main/Training_Set.ipynb) for image segmentation using simulated lenses
* Step 4: Use pre-trained U-Net & training set to [prepare image segmentation](https://github.com/gilliancartwright/Image-Segmentation/blob/main/Segmentation.ipynb)
* Step 5: Run lens candidates through image segmentation
* Step 6: Use `lenstronomy` model to [find lens models](https://github.com/gilliancartwright/Image-Segmentation/blob/main/New_Model.ipynb) for lens candidates (currently run on simulations)

## Acknowledgements & Packages
Thank you to Jimena González (@JimenaGonzalez) and Professor Keith Bechtol at the University of Wisconsin -- Madison for all of your support in this project. Also, thank you to Simon Birrer (@sibirrer) and Anowar Shajib (@ajshajib) for your expertise and guidance in the lens modeling process.

***Packages:***
* `lenstronomy`: "`lenstronomy` is a multi-purpose software package to model strong gravitational lenses." -- [read the docs here](https://lenstronomy.readthedocs.io/en/latest/index.html)
* `pytorch`: "PyTorch is an optimized tensor library for deep learning using GPUs and CPUs." -- [read the docs here](https://pytorch.org/docs/stable/index.html)
