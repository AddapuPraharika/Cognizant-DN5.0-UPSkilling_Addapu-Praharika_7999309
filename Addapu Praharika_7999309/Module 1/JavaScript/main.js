console.log("Welcome to the Community Portal");

window.onload = function () {

    let savedEvent =
        localStorage.getItem("selectedEvent");

    if (
        savedEvent &&
        document.getElementById("eventType")
    ) {

        document.getElementById("eventType").value =
            savedEvent;
    }
};

function validatePhone() {

    let phone =
        document.getElementById("phone").value;

    if (phone.length != 10) {

        alert("Please enter a valid 10 digit phone number");
    }
}

function showFee() {

    let eventFee =
        document.getElementById("eventType").value;

    document.getElementById("fee").innerHTML =
        "Event Fee: ₹" + eventFee;

    localStorage.setItem(
        "selectedEvent",
        eventFee
    );
}

function countCharacters() {

    let message =
        document.getElementById("message").value;

    document.getElementById("charCount").innerHTML =
        "Characters: " + message.length;
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

function enlargeImage(img) {

    if (img.style.width === "400px") {

        img.style.width = "250px";

    } else {

        img.style.width = "400px";
    }
}

function findLocation() {

    navigator.geolocation.getCurrentPosition(

        function (position) {

            document.getElementById("location").innerHTML =

                "Latitude: " +
                position.coords.latitude +

                "<br>Longitude: " +
                position.coords.longitude;
        },

        function () {

            alert("Unable to access location");
        }
    );
}

function clearPreferences() {

    localStorage.clear();

    alert("Preferences Cleared");
}