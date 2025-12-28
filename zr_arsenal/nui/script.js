window.addEventListener('message', function(event) {
    if (event.data.showMenu) {
        document.getElementById('app').style.display = 'flex';
        changeCategory('rifles');
    } else if (event.data.type === 'close') {
        closeMenu();
    }
});

document.onkeyup = function(data) {
    if (data.which == 27) {
        closeMenu();
    }
};

function closeMenu() {
    document.getElementById('app').style.display = 'none';
    fetch(`http://zr_arsenal/NUIFocusOff`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8',
        },
        body: JSON.stringify({})
    });
}

function changeCategory(categoryName) {
    let categories = document.querySelectorAll('.category-group');
    categories.forEach(el => el.classList.add('hidden'));

    let buttons = document.querySelectorAll('.nav-btn');
    buttons.forEach(btn => btn.classList.remove('active'));

    document.getElementById(categoryName).classList.remove('hidden');

    const btnMap = {
        'rifles': 0,
        'pistolas': 1,
        'utilitarios': 2
    };
    
    if (buttons[btnMap[categoryName]]) {
        buttons[btnMap[categoryName]].classList.add('active');
    }
}

function postData(action) {
    fetch(`http://zr_arsenal/${action}`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8',
        },
        body: JSON.stringify({})
    });
    
}