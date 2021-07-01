class Clock {
    constructor() {
        // 1. Create a Date object.
        // 2. Store the hours, minutes, and seconds.
        // 3. Call printTime.
        // 4. Schedule the tick at 1 second intervals.
        const time = new Date();
        [this.hours, this.minutes, this.seconds] = [time.getHours(), time.getMinutes(), time.getSeconds()];
        this.printTime();
        setInterval(this._tick.bind(this), 1000);
    }

    printTime() {
        // Format the time in HH:MM:SS
        // Use console.log to print it.
        let h = this.hours;
        let m = this.minutes;
        let s = this.seconds;
        console.log(`${h}:${m}:${s}`);
    }

    _tick() {
        // 1. Increment the time by one second.
        // 2. Call printTime.
        this._incSec();

        this.printTime();
    }

    _incSec() {
        this.seconds += 1;
        if (this.seconds >= 60) {
            this.seconds = 0;
            this._incMin();
        }
    }

    _incMin() {
        this.minutes += 1;
        if (this.minutes >= 60) {
            this.minutes = 0;
            this._incHours();
        }
    }

    _incHours() {
        this.hours += 1;
        if (this.hours >= 24) {
            this.hours = 0;
        }
    }
};

const clock = new Clock();
