% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/materials.R
\name{light}
\alias{light}
\title{Light Material}
\usage{
light(color = "#ffffff", intensity = 10, importance_sample = TRUE)
}
\arguments{
\item{color}{Default `white`. The color of the light Can be either
a hexadecimal code, R color string, or a numeric rgb vector listing three intensities between `0` and `1`.}

\item{intensity}{Default `NA`. If a positive value, this will turn this object into a light emitting the value specified
in `color` (ignoring other properties). Higher values will produce a brighter light.}

\item{importance_sample}{Default `TRUE`. Keeping this on for lights improves the convergence of the rendering 
algorithm, in most cases. If the object is particularly important in contributing to the light paths
in the image (e.g. light sources, refracting glass ball with caustics, metal objects concentrating light),
this will help with the convergence of the image.}
}
\value{
Single row of a tibble describing the diffuse material.
}
\description{
Light Material
}
\examples{
#Generate the cornell box without a light and add a single white sphere to the center
scene = generate_cornell(light=FALSE) \%>\%
  add_object(sphere(x=555/2,y=555/2,z=555/2,radius=555/8,material=light()))
\donttest{
render_scene(scene, lookfrom=c(278,278,-800),lookat = c(278,278,0), samples=500,
             aperture=0, fov=40, ambient_light=FALSE, parallel=TRUE)
}

#All gather around the orb
scene = generate_ground(material = diffuse(checkercolor="grey50")) \%>\%
  add_object(sphere(radius=0.5,material=light(intensity=5,color="red"))) \%>\%
  add_object(obj_model(r_obj(), z=-3,x=-1.5,y=-1, angle=c(0,45,0))) \%>\%
  add_object(pig(scale=0.3, x=1.5,z=-2,y=-1.5,angle=c(0,-135,0)))
\donttest{
render_scene(scene, samples=500, parallel=TRUE, clamp_value=10)
}
}
