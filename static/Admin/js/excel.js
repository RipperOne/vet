function addParam(param, value) {
    const url = new URL(window.location.href);
    url.searchParams.append(param, value);
    return url.href;
}
