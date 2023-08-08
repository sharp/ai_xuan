function calculateDaysBetweenDates(_begin, end) {
    const begin = new Date(_begin);
    const diff = end.getTime() - begin.getTime();
    return diff / (1000 * 3600 * 24);
}

function calculateDaysBetweenDates(begin, end) {
}


// Return the current time
function getCurrentTime() {
    return new Date();
}