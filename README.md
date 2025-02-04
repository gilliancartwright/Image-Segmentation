# Image-Segmentation
Working with [@JimenaGonzalez](https://github.com/JimenaGonzalez) to use image segmentation for automated `lenstronomy` lens modeling.

## File Descriptions:
* Dockerfile: run in OSG to create container image (docker build). Run image to create container (docker run).
* Labeling.ipynb: create training images from simulated data. Output is FITS file of original simulations and corresponding segmentation maps.
* Segmentation-MultiClass.ipynb: script to create and train UNet using output of Labeling.ipynb. Output is trained model.pt.
* Running-Segmentation.ipynb: Run trained UNet on candidates. Output is FITS file of original images with corresponding segmented images
* Model.ipynb: script to model candidates. Requires output of UNet, but has not been updated to use the output of EfficientNet.
  * get_rms: function to estimate the background noise based on output of UNet
  * get_lens_coords ***(should be replaced with estimates from EfficientNet)***: function to estimate the center of the lens and upper/lower limits on lens location using output of UNet 
  * approx_theta_E ***(should be replaced with estimates from EfficientNet)***: function to estimate the Einstein radius of the source using output of UNet
  * add_mask: masks out noise determined by UNet
  * Output of Model.ipynb: corner plot png, trace plot png, parameters text file, and image of observed, reconstructed, and residuals image for G, R, and I bands.
* MakeLensModelPNGs.ipynb: script to compile output from Model.ipynb in OSG. The output of the script is a single png image per modeled candidate.

## Procedure:
![flowchart](https://github.com/gilliancartwright/Image-Segmentation/assets/106614337/15f25628-6429-4afe-82c5-b1b72b91bb51)

* Step 1: [Simulate lens systems](https://github.com/JimenaGonzalez/Simulations-Double-Source-Gravitational-Lensing) ([@JimenaGonzalez](https://github.com/JimenaGonzalez))
* Step 2: [Find lens candidates](https://github.com/JimenaGonzalez/Searching-double-lenses) [(González, 2025)](https://arxiv.org/abs/2501.15679)
* Step 3: [Create training set]() for image segmentation using simulated lenses
* Step 4: Use pre-trained U-Net & training set to [prepare image segmentation]()
* Step 5: Run lens candidates through image segmentation
* Step 6: Use `lenstronomy` model to [find lens models]() for lens candidates

## Acknowledgements & Packages
Thank you to Jimena González (@JimenaGonzalez) and Professor Keith Bechtol at the University of Wisconsin -- Madison for all of your support in this project. Also, thank you to Simon Birrer (@sibirrer) and Anowar Shajib (@ajshajib) for your expertise and guidance in the lens modeling process.

***Packages:***
* `lenstronomy`: "`lenstronomy` is a multi-purpose software package to model strong gravitational lenses." -- [read the docs here](https://lenstronomy.readthedocs.io/en/latest/index.html)
* `PyTorch`: "PyTorch is an optimized tensor library for deep learning using GPUs and CPUs." -- [read the docs here](https://pytorch.org/docs/stable/index.html)
* `segmentation_models_pytorch`: "Python library with Neural Networks for Image Segmentation based on PyTorch" -- [read the docs here](https://segmentation-modelspytorch.readthedocs.io/en/latest/)
