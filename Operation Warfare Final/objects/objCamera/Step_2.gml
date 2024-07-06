///@description apply screen shake
var shake = power(shakeValue, 2) * shakePower;
x += random_range(-shake, shake);
y += random_range(-shake, shake);

// apply camera position
camera_set_view_angle(view_camera[0], random_range(-shake, shake) * 0.5);

// reduce screen shake
if (shakeValue > 0) shakeValue -= 0.05;