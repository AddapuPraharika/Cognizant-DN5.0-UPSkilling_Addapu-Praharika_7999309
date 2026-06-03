// Task: JavaScript Functions

function validatePhone() {

    let phoneNumber =
        document.getElementById("phone").value;

    if (phoneNumber.length != 10) {

        alert("Please enter a valid 10 digit phone number");
    }
}

function showFee() {

    let selectedEvent =
        document.getElementById("eventType").value;

    document.getElementById("fee").innerHTML =
        "Event Fee: ₹" + selectedEvent;

    localStorage.setItem(
        "selectedEvent",
        selectedEvent
    );
}

function countCharacters() {

    let text =
        document.getElementById("message").value;

    document.getElementById("charCount").innerHTML =
        "Characters: " + text.length;
}

function submitForm() {

    let name =
        document.getElementById("name").value;

    let email =
        document.getElementById("email").value;

    if (name === "" || email === "") {

        alert("Please fill all fields");

        return;
    }

    alert("Registration Successful");
}

function enlargeImage(image) {

    if (image.style.width == "400px") {

        image.style.width = "250px";

    } else {

        image.style.width = "400px";
    }
}

window.onload = function () {

    let savedEvent =
        localStorage.getItem("selectedEvent");

    if (savedEvent &&
        document.getElementById("eventType")) {

        document.getElementById("eventType").value =
            savedEvent;

        document.getElementById("fee").innerHTML =
            "Event Fee: ₹" + savedEvent;
    }
};