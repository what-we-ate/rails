// https://github.com/bengourley/module.js

(function(){var modules={},instances={};function require(path){var resolved=require.resolve(path);if(typeof modules[resolved]==="undefined"){throw new Error("Module `"+path+"` is not defined")}if(!instances[path]){var m={exports:{}};modules[resolved].apply({},[m,m.exports,require.relative(resolved)]);instances[resolved]=m.exports}return instances[resolved]}require.resolve=function(path){var orig=path,filename=path+".js",index=path+"/index.js";return modules[filename]&&filename||modules[index]&&index||orig};require.relative=function(parent){return function(p){if("."!==p.charAt(0))return require(p);var path=parent.split("/"),segs=p.split("/");path.pop();for(var i=0;i<segs.length;i++){var seg=segs[i];if(".."===seg){path.pop()}else if("."!==seg){path.push(seg)}}return require(path.join("/"))}};require.register=function(path,fn){if(typeof modules[path]!=="undefined"){throw new Error("Module `"+path+"` is already defined")}modules[path]=fn;return};window.require=require;window.module=require.register})();
