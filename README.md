# b1_camera_optimisation
This project aims to use optimisation to build a real world model of a camera suitable for use in computer vision. 
The model is built considering a fixed focus, pin hole camera design. A grid of points was used as a calibration object

First the camera model and a calibration grid is positioned somewhere in space. A
noisy image of the grid is generated and some outliers added. A transformation matrix (which transforms
points from an object frame to the camera frame) called a homography is estimated with the help of
RANSAC to reject outliers. A number of images are used to estimate homographies from which a matrix
(k-matrix) entailing the intrinsic properties of the camera model is built. This estimated k-matrix is then
optimized to produce the model for the camera.

Load RunOptimiseKMatrix.m for full estimation and optimisation of a camera K- matrix

Please read Calibrating a digital camera for computer vision.pdf for more information
