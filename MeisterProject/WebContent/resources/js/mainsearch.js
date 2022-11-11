var App = /** @class */ (function () {
    function App() {
        var _this = this;
        this.select = function (e) { return document.querySelector(e); };
        this.selectAll = function (e) { return document.querySelectorAll(e); };
        this.mainTl = new TimelineMax({ paused: true });
        this.search = this.select('#search');
        this.magnifier = this.select('#magnifier');
        this.searchGroup = this.select('#searchGroup');
        this.close = this.select('.close');
        this.wholeSearch = this.select('.wholeSearch');
        this.hit = this.select('#hit');
        this.fieldWidth = 301;
        this.searchWidth = 210;
        this.seX = -260;
        this.fieldX = -260;
        this.growInc = 15;
        this.magStartX = -200;
        this.magEndX = -258;
        this.searchGroupX = 100;
        this.wholeSearchX = 400;
        this.searchX = 74;
        this.minChars = 15;
        this.maxChars = 26;
        this.charCount = 1;
        this.clearField = function (e) {
            if (_this.search.value == "") {
                _this.doOutro();
            }
            else {
                //this.search.value = "";
                TweenMax.to(_this.search, 0.2, {
                    value: '',
                    onComplete: _this.resetFieldWidth,
                    ease: Linear.easeNone
                });
                _this.search.focus();
            }
        };
        this.doOutro = function (e) {
            _this.hit.classList.remove('disabled');
            _this.searchGroup.classList.remove('disabled');
            var outroTl = new TimelineMax({ onComplete: function () {
                    _this.search.value = "";
                    _this.mainTl.pause(0);
                } }).timeScale(1);
            outroTl.to([_this.magnifier, _this.close, _this.search], 0.2, {
                autoAlpha: 0,
                ease: Sine.easeIn
            })
                .to('#se', 1, {
                x: 0,
                ease: Expo.easeInOut
            }, '-=0.2')
                .to('#field', 1, {
                attr: {
                    width: 41
                },
                x: 0,
                ease: Expo.easeInOut
            }, '-=1')
                .to(_this.search, 1, {
                width: _this.searchWidth,
                x: _this.searchX,
                ease: Expo.easeInOut
            }, '-=1')
                .to(_this.wholeSearch, 1, {
                attr: {
                    x: 300
                },
                ease: Expo.easeInOut
            }, '-=1');
        };
        this.onKeyDown = function (e) {
            _this.charCount = _this.search.value.length + 1;
            if (_this.charCount >= _this.minChars) {
                var diffChars = _this.charCount - _this.minChars;
                TweenMax.to('#se', 0.2, {
                    x: _this.seX - (diffChars * _this.growInc)
                });
                TweenMax.to('#field', 0.2, {
                    attr: {
                        width: _this.fieldWidth + (diffChars * _this.growInc)
                    },
                    x: _this.fieldX - (diffChars * _this.growInc)
                });
                TweenMax.to(_this.search, 0.2, {
                    x: _this.searchX + (diffChars * (_this.growInc / 2)),
                    width: _this.searchWidth + (diffChars * _this.growInc)
                });
                TweenMax.to(_this.magnifier, 0.2, {
                    x: _this.magEndX - (diffChars * _this.growInc)
                });
                TweenMax.to(_this.wholeSearch, 0.2, {
                    attr: {
                        x: _this.wholeSearchX + (diffChars * (_this.growInc / 2))
                    }
                });
                TweenMax.to(_this.close, 0.2, {
                    x: (diffChars * (_this.growInc / 2))
                });
            }
            if (_this.search.value != "") {
                //this.hit.classList.add('disabled');
                //this.searchGroup.classList.add('disabled');
            }
        };
        this.resetFieldWidth = function () {
            var tl = new TimelineMax();
            tl.to('#se', 1, {
                x: _this.seX,
                ease: Expo.easeInOut
            })
                .to('#field', 1, {
                attr: {
                    width: _this.fieldWidth
                },
                x: _this.fieldX,
                ease: Expo.easeInOut
            }, 0)
                .to(_this.search, 1, {
                x: _this.searchX,
                width: _this.searchWidth,
                ease: Expo.easeInOut
            }, 0)
                .to(_this.magnifier, 1, {
                x: _this.magEndX,
                ease: Expo.easeInOut
            }, 0)
                .to(_this.wholeSearch, 1, {
                attr: {
                    x: _this.wholeSearchX
                },
                ease: Expo.easeInOut
            }, 0)
                .to(_this.close, 1, {
                x: 0,
                ease: Expo.easeInOut
            }, 0);
        };
        this.clickSearch = function (e) {
            //console.log("clickSearch");
            if (_this.mainTl.time() == 0) {
                _this.mainTl.play(0);
            }
            else {
                _this.doOutro();
            }
        };
        this.closeSearch = function (e) {
            if (_this.mainTl.time() > 0) {
                if (e.target.classList.contains('close-search')) {
                    _this.doOutro();
                }
            }
        };
        document.body.classList.add('close-search');
        TweenMax.globalTimeScale(2);
        var tl = new TimelineMax();
        TweenMax.set(this.search, {
            x: this.searchX,
            y: 12,
            xPercent: -50,
            yPercent: 0
        });
        TweenMax.set(this.close, {
            x: 0,
            y: 0
        });
        //this.mainTl.add(tl);
        this.mainTl.to('#se', 1, {
            x: this.seX,
            ease: Expo.easeInOut
        })
            .to('#field', 1, {
            attr: {
                width: this.fieldWidth
            },
            x: this.fieldX,
            ease: Expo.easeInOut
        }, '-=1')
            .to(this.wholeSearch, 1, {
            attr: {
                x: this.wholeSearchX
            },
            ease: Expo.easeInOut
        }, '-=1')
            .fromTo(this.magnifier, 1, {
            autoAlpha: 0,
            scale: 0,
            //rotation:-90,
            transformOrigin: '0% 45%',
            x: this.magStartX
        }, {
            autoAlpha: 0.38,
            rotation: 0,
            scale: 1,
            transformOrigin: '0% 45%',
            x: this.magEndX,
            ease: Expo.easeInOut
        }, '-=0.95')
            .fromTo(this.close, 1, {
            autoAlpha: 0,
            scale: 0,
            //rotation:-90,
            transformOrigin: '50% 50%',
            svgOrigin: '511 300',
            x: 0
        }, {
            autoAlpha: 0.5,
            rotation: 0,
            scale: 1,
            transformOrigin: '50% 50%',
            svgOrigin: '511 300',
            x: 0,
            ease: Expo.easeInOut
        }, '-=1')
            .from(this.search, 0.5, {
            autoAlpha: 0
        }, '-=0.5')
            .addPause('+=0', function () { this.search.focus(); }, [], this);
        this.close.addEventListener('click', this.clearField);
        this.wholeSearch.addEventListener('click', this.clickSearch);
        this.wholeSearch.addEventListener('touchstart', this.clickSearch);
        document.body.addEventListener('click', this.closeSearch);
        this.search.addEventListener('keydown', this.onKeyDown);
    }
    return App;
}());
TweenMax.set('svg', {
    visibility: 'visible'
});
var app = new App();