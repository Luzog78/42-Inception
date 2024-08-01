const body = document.getElementById('body');
const nb = document.getElementById('nb');


function randHex() {
	return Math.floor(Math.random() * 256).toString(16).padStart(2, '0');
}


function randColor() {
	return `#${randHex()}${randHex()}${randHex()}`;
}

body.style.backgroundColor = randColor();

container.addEventListener('click', (e) => {
	if (!nb)
		return;
	e.preventDefault();
	let n = parseInt(nb.textContent, 10);
	if (isNaN(n))
		n = 0;
	n++;
	nb.textContent = n;
	body.style.backgroundColor = randColor();
});
