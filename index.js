var nativefier = require("nativefier").default;

var options = {
    name: 'Scratch 3.0', // will be inferred if not specified
    targetUrl: 'llk.github.io/scratch-gui', // required
    platform: 'win32', // defaults to the current system
    arch: 'x64', // defaults to the current system
    asar: true, // see conceal
    showMenuBar: false,
    minWidth: 1200,
    minHeight: 800,
    width: 1200,
    height: 800,
    out: './out'
};
nativefier(options, function(error, appPath) {
    if (error) {
        console.error(error);
        return;
    }
    console.log('App has been nativefied to', appPath);
});
options = {
    name: 'Scratch 3.0', // will be inferred if not specified
    targetUrl: 'llk.github.io/scratch-gui', // required
    platform: 'win32', // defaults to the current system
    arch: 'ia32', // defaults to the current system
    asar: true, // see conceal
    showMenuBar: false,
    minWidth: 1200,
    minHeight: 800,
    width: 1200,
    height: 800,
    out: './out'
};
nativefier(options, function(error, appPath) {
    if (error) {
        console.error(error);
        return;
    }
    console.log('App has been nativefied to', appPath);
});
options = {
    name: 'Scratch 3.0', // will be inferred if not specified
    targetUrl: 'llk.github.io/scratch-gui', // required
    platform: 'linux', // defaults to the current system
    arch: 'x64', // defaults to the current system
    asar: true, // see conceal
    showMenuBar: false,
    minWidth: 1200,
    minHeight: 800,
    width: 1200,
    height: 800,
    out: './out'
};
nativefier(options, function(error, appPath) {
    if (error) {
        console.error(error);
        return;
    }
    console.log('App has been nativefied to', appPath);
});
options = {
    name: 'Scratch 3.0', // will be inferred if not specified
    targetUrl: 'llk.github.io/scratch-gui', // required
    platform: 'linux', // defaults to the current system
    arch: 'ia32', // defaults to the current system
    asar: true, // see conceal
    showMenuBar: false,
    minWidth: 1200,
    minHeight: 800,
    width: 1200,
    height: 800,
    out: './out'
};
nativefier(options, function(error, appPath) {
    if (error) {
        console.error(error);
        return;
    }
    console.log('App has been nativefied to', appPath);
});
options = {
    name: 'Scratch 3.0', // will be inferred if not specified
    targetUrl: 'llk.github.io/scratch-gui', // required
    platform: 'mac', // defaults to the current system
    arch: 'x64', // defaults to the current system
    asar: true, // see conceal
    showMenuBar: false,
    minWidth: 1200,
    minHeight: 800,
    width: 1200,
    height: 800,
    out: './out'
};
nativefier(options, function(error, appPath) {
    if (error) {
        console.error(error);
        return;
    }
    console.log('App has been nativefied to', appPath);
});
options = {
    name: 'Scratch 3.0', // will be inferred if not specified
    targetUrl: 'llk.github.io/scratch-gui', // required
    platform: 'mac', // defaults to the current system
    arch: 'ia32', // defaults to the current system
    asar: true, // see conceal
    showMenuBar: false,
    minWidth: 1200,
    minHeight: 800,
    width: 1200,
    height: 800,
    out: './out'
};
nativefier(options, function(error, appPath) {
    if (error) {
        console.error(error);
        return;
    }
    console.log('App has been nativefied to', appPath);
});
