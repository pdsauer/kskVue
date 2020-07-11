class Helper {
    static timeToNormal(time) {
        if (time) {
            let data = time.split(".");
            let hours = data[0];
            let minutes = Math.floor((Math.abs(data[1]) * 3) / 5);
            if (hours === 0 || hours === "") {
                hours = "00";
            } else if (hours < 10) {
                hours = "0" + hours;
            }

            if (minutes.toString().length === 1) {
                minutes += "0";
            }
            return hours + ":" + minutes;
        }
    }
    static timeToDecimal(time) {
        if (time) {
            let data = time.split(":");
            let hours = data[0] * 100;
            let minutes = data[1] * (5 / 3);
            return (hours + minutes) / 100;
        }
    }
}

export default Helper;
