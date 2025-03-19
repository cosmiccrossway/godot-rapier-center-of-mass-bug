# godot-rapier-center-of-mass-bug
A project replicating the center of mass bug in Godot with the Rapier physics addon.

To run this project, download Godot 4.4, clone this repository and import the project
into Godot. Once opened run the project.

There will be a smaller Godot icon as the rigid body and a larger Godot icon as the
background to make it easier to see movement.

The rigid body is set up with a collision polygon that is off center from the rigid
body position. The rigid body's center of mass is set via code to be the position
of the CenterOfMassPosition Node2D, which is positioned to be centered in the collision
polygon.

There are another two Node2Ds that are set up to be thrusters at the bottom of the
collision polygon, and each an equal distance to the left and right of the 
CenterOfMassPosition Node2D.

These thrusters are set up with inputs so that when the W key is pressed, both
thrusters will fire, and when the A key is pressed, the right thruster will fire,
causing it to turn left, and when the D key is pressed the left thruster will fire,
causing it to turn right. There's also a thrust multiplier set up so that if, for
example, both the W and A keys are pressed, then the thuster hooked up to the A
key will fire with twice the amount of thrust, so that the turning can still occur.

Now with Rapier physics enabled (which is currently is within this project), it will
use the rigid body position as the center of mass instead of the actually specified
center of mass. In this setup, the rigid body position is off center to the left
of the collision polygon, and directly above the left thruster.

Due to this, when you press the W key, it will make circles spinning to the left,
instead of going straight as would be expected if it were using the center of mass
specified.

If you then go into project settings and switch the 2D physics back to the default
Godot physics, and save and restart the project, then rerun the project, it will
then work as expected with the default physics taking the specified center of
mass into account, making it so that the W key will make the rigid body move
forward in a straight line, and the A and D keys will turn it left and righ as
expected.
