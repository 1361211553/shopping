!function () {
    function e(e) {
        return !(!e || !s.test(e))
    }

    function t(e, t) {
        this.dataCache = {}, this.hidden = !0, this.index = null, this.jqInput = e, this.jqSug = null, this.jqItems = null, this.jqCurItem = null, this.onInput = $.Callbacks(), this.onNav = $.Callbacks(), this.onSelect = $.Callbacks(), this.options = $.extend({
            delay: 200,
            dataTimeout: 2e3,
            navThrottle: 32,
            triggerOnFocus: !0,
            submitOnEnter: !0,
            wrapper: '<div class="search-suggest"></div>',
            template: null,
            itemSelector: "li[data-sug-item]",
            itemHostSelector: "li[data-hotwords]",
            curItemClass: "suggest-cur-item",
            dataSource: null
        }, t), this.dataSource = this.options.dataSource, this._lastVal = null, this.init()
    }

    function i(e) {
        var t = 32;
        return e && e.length > t && (e = e.substring(0, t)), e
    }

    var s = /\{\s*\[(?:native code|function)\]\s*\}/i, a = a || {
            mix: function (e, t, i) {
                var s;
                for (s in t)i !== !0 && s in e || (e[s] = t[s]);
                return e
            }, Object: e(Object.create) ? function (e) {
                return Object.create(e)
            } : function () {
                function e() {
                }

                return function (t) {
                    return e.prototype = t, new e
                }
            }(), extend: function (e, t, i, s) {
                if (!t || !e)throw new Error("extend failed, verify dependencies");
                var r = t.prototype, n = a.Object(r);
                return e.prototype = n, n.constructor = e, e.superclass = r, e.base = t, t != Object && r.constructor == Object.prototype.constructor && (r.constructor = t), i && a.mix(n, i, !0), s && a.mix(e, s, !0), e
            }, Class: function (e, t, i) {
                return a.extend(e, Object, t, i)
            }
        };
    t.prototype = {
        init: function () {
            var e = this, t = this.options;
            t.template && (this.compiledTemplate = _.template(t.template));
            var i = _.debounce(function (t) {
                null == e.dataCache[t] && t === e.val() && e.hide()
            }, t.dataTimeout);
            this._checkDataTimeout = function (t) {
                null == e.dataCache[t] && i(t)
            };
            var s = _.debounce(function () {
                var t = e._checkVal(e.val());
                t === !1 && e.jqItems && e.jqItems.length > 0 && e.show()
            }, t.delay);
            if ("oninput" in this.jqInput[0] && !/Edge\/|Trident\/|MSIE /.test(window.navigator.userAgent))this.jqInput.on("input.suggest", s); else {
                var a = [9, 13, 27, 37, 38, 39, 40];
                this.jqInput.on("keyup.suggest paste.suggest cut.suggest", function (e) {
                    e && -1 !== _.indexOf(a, e.keyCode) || s()
                })
            }
            t.triggerOnFocus && this.jqInput.on("focus.suggest", s), t.submitOnEnter || this.jqInput.on("keydown.suggest", function (e) {
                13 == e.keyCode && e.preventDefault()
            });
            var r = _.throttle(function (i) {
                if (e.jqItems) {
                    var s = e.jqItems.length;
                    if (s) {
                        var a = e.index;
                        "up" === i ? null == a ? a = s - 1 : (a -= 1, 0 > a && (a = null)) : "down" === i && (null == a ? a = 0 : (a += 1, a > s - 1 && (a = null))), e.index = a, e.jqCurItem && (e.jqCurItem.removeClass(t.curItemClass), e.jqCurItem = null), null != a && (e.jqCurItem = e.jqItems.eq(a).addClass(t.curItemClass)), e.hidden && e.show(), e.onNav.fire(e.jqCurItem, a, i)
                    }
                }
            }, t.navThrottle);
            this.jqInput.on("keydown.suggest", function (t) {
                switch (t.keyCode) {
                    case 13:
                        e.jqCurItem && e.onSelect.fire(e.jqCurItem, t);
                        break;
                    case 38:
                        t.preventDefault(), r("up");
                        break;
                    case 40:
                        t.preventDefault(), r("down")
                }
            }).on("keyup.suggest", function (t) {
                27 == t.keyCode && e.hide()
            }), $(document).on("click.suggest focus.suggest", function (t) {
                var i = $(t.target);
                i.is(e.jqInput) || e.jqSug && i.closest(e.jqSug).length > 0 || e.hide()
            })
        }, _checkVal: function (e) {
            if (e === this._lastVal)return !1;
            var t = this;
            if (this.onInput.fire(e, this._lastVal), this._lastVal = e, this.dataSource) {
                var i = this.dataSource(e, function (i) {
                    i && (t.dataCache[e] = i, t.val() === e && t.render(i, e))
                });
                i ? (this.dataCache[e] = i, this.render(i, e)) : i === !1 ? this._checkDataTimeout(e) : this.dataCache[e] ? this.render(this.dataCache[e], e) : this.hide()
            }
        }, val: function () {
            if (0 == arguments.length)return $.trim(this.jqInput.val()) || "";
            var e = arguments[0];
            this.jqInput.val(e), arguments[1] !== !0 && this._checkVal(e)
        }, getLastQuery: function () {
            return this._lastVal || ""
        }, initItems: function () {
            this.jqItems = this.jqSug.find(this.options.itemSelector), this.jqCurItem = $(".search-items").find("." + this.options.curItemClass), this.index = this.jqCurItem.length ? this.jqItems.index(this.jqCurItem) : null
        }, initWrapper: function () {
            if (!this.jqSug) {
                var e = this, t = this.options;
                this.jqSug = $(t.wrapper).hide().appendTo(t.container), this.jqSug.on("mouseenter", t.itemSelector, function () {
                    e.jqCurItem && e.jqCurItem.get(0) != this && e.jqCurItem.removeClass(t.curItemClass);
                    var i = $(this);
                    e.jqCurItem = i.addClass(t.curItemClass), e.index = e.jqItems.index(i)
                }).on("mouseleave", t.itemSelector, function () {
                    e.jqCurItem && e.jqCurItem.get(0) == this && (e.jqCurItem.removeClass(t.curItemClass), e.jqCurItem = null, e.index = null)
                }).on("click", t.itemSelector, function (t) {
                    e.onSelect.fire($(this), t)
                }).on("click", t.itemHostSelector, function () {
                    var e = $(this).data("hotwords");
                    try {
                        e && ya.reportProductEvent({
                            eid: "click/search/hotwords/" + e,
                            eid_desc: "\u70b9\u51fb/\u641c\u7d22/\u70ed\u8bcd/" + e
                        })
                    } catch (t) {
                    }
                })
            }
        }, render: function (e) {
            this.initWrapper(), this.compiledTemplate && this.jqSug.html(this.compiledTemplate(e))
        }, show: function () {
            return this.jqSug ? (this.jqSug.show(), this.hidden = !1, this) : void 0
        }, hide: function () {
            return this.jqSug && this.jqSug.hide(), this.hidden = !0, this.jqCurItem && (this.jqCurItem.removeClass(this.options.curItemClass), this.jqCurItem = null, this.index = null), this
        }, destroy: function () {
            this.jqInput && (this.jqInput.off("input.suggest keyup.suggest paste.suggest cut.suggest keydown.suggest focus.suggest"), $(document).off("click.suggest focus.suggest"), this.jqInput = null, this.jqSug && (this.jqSug.remove(), this.jqSug = null))
        }
    };
    var r = TT.app.main, n = TT.isProd ? "//search.cdn.huya.com" : "//test.search.huya.com", o = [], c = r + "cache10min.php?m=Search&do=getHotword&v=2", h = function () {
        var e = "huya_search_history", t = "{%SP%}", s = [], a = 5, r = localStorage.getItem(e);
        if (r)try {
            s = r.split(t)
        } catch (n) {
        }
        return {
            getList: function () {
                return s
            }, getLength: function () {
                return s.length
            }, _set: function (i) {
                s.length = 0, _.each(i, function (e) {
                    s.push(e)
                }), i.length > 0 ? localStorage.setItem(e, i.join(t)) : localStorage.removeItem(e)
            }, add: function (e) {
                if (e = i(e)) {
                    s.unshift(e);
                    var t = _.uniq(s);
                    t.length > a && (t = t.slice(0, a)), this._set(t)
                }
            }, remove: function (e) {
                if (e = i(e)) {
                    var t = _.without(s, e);
                    t.length != s.length && this._set(t)
                }
            }, clear: function () {
                this._set([])
            }
        }
    }();
    window.SearchSuggest = a.extend(function (e, s) {
        var a = this;
        this.historyData = h, t.call(this, e, $.extend({
            template: '<% if(history.length){ %><div class="his-items-wrap"><ul class="his-items"><% _.each(history,function(text, ii){ %><li data-sug-item="<%- text %>" class="clickstat" eid="click/search/history/<%=ii%>"><a href="javascript:;" class="del-item-link"><span>x</span></a><em></em><%- checkMaxLength(text) %></li><% }) %></ul><a class="clear-his-btn clickstat" eid="click/search/history/clear" href="javascript:;">\u6e05\u7a7a\u8bb0\u5f55</a></div><% } if(history.length && suggest.length){ %><div class="his-items-line"></div><% } if(suggest.length){ %><ul class="search-items"><% var renderFirstTime = 0; %><% _.each(suggest,function(item, i){ %><% if(item.type!=0){renderFirstTime++;} %><%if(typeof isHot != "undefined" && isHot){%><li data-sug-item="<%- item.text %>" data-hotwords="<%- item.text %>" class="<%= renderFirstTime==1 && item.type != 0 ? "search-item-hover" : ""%>"><em<% if(i<3){ %> class="top-item"<% } %>><%= i+1 %></em><span class="<%= item.type != 0 ? "suggest-text hot" : "" %>"><%- checkMaxLength(item.text) %></span><% if(item.type !=0){ %><a class="suggest-link" href="<%= TT.app.main + (item.type == 2 ? "g/" : "") + item.id %>"><%= item.type == 2 ? "\u8fdb\u5165\u5217\u8868" : "\u8fdb\u5165\u76f4\u64ad\u95f4" %></a><% } %></li><% }else{ %><li data-sug-item="<%- item.text %>" class="<%= renderFirstTime==1 && item.type != 0 ? "search-item-hover" : ""%>"><span class="<%= item.type != 0 ? "suggest-text" : "" %>"><%- checkMaxLength(item.text) %></span><% if(item.type !=0){ %><a class="suggest-link" href="<%= TT.app.main + (item.type == 2 ? "g/" : "") + item.id %>"><%= item.type == 2 ? "\u8fdb\u5165\u5217\u8868" : "\u8fdb\u5165\u76f4\u64ad\u95f4" %></a><% } %></li><% } %><% }) %></ul><% } %>',
            curItemClass: "search-item-hover",
            dataSource: function (e, t) {
                if (!e) {
                    if (o.length > 0) {
                        var s = o.length - h.getLength();
                        s = 0 > s ? 0 : s, t({
                            checkMaxLength: i,
                            history: h.getList(),
                            suggest: o.slice(0, s),
                            isHot: !0
                        })
                    } else $.ajax({
                        url: c,
                        type: "get",
                        dataType: "jsonp",
                        cache: !0,
                        jsonpcallback: "searchHotData"
                    }).success(function (e) {
                        if (o.length > 0)return !1;
                        $.each(e, function (e, t) {
                            o.push({id: t.associate_id, text: t.hot_word, type: t.word_type})
                        });
                        var s = o.length - h.getLength();
                        s = 0 > s ? 0 : s, t({
                            checkMaxLength: i,
                            history: h.getList(),
                            suggest: o.slice(0, s),
                            isHot: !0
                        })
                    });
                    return !1
                }
                var r = a.dataCache[e];
                return r ? t(r) : $.ajax(n, {
                    data: {
                        m: "Search",
                        "do": "getSearchContent",
                        q: e,
                        uid: 0,
                        v: 4,
                        typ: -7,
                        livestate: 0,
                        rows: 5
                    }, dataType: "jsonp"
                }).success(function (s) {
                    var r = s;
                    if (0 !== r.responseHeader.status)return !1;
                    var n = r.response[1024].docs || [], o = [];
                    $.each(n, function (e, t) {
                        t.associate_word && o.push({id: t.associate_id, text: t.associate_word, type: t.word_type})
                    });
                    var c = [], h = [];
                    $.each(o, function (e, t) {
                        -1 === $.inArray(t.text, h) && (c.push(t), h.push(t.text))
                    });
                    var l = a.dataCache[e] = {checkMaxLength: i, history: [], suggest: c.slice(0, 10)};
                    t(l)
                }), !1
            }
        }, s)), this.onItemSelect = $.Callbacks(), this.onSelect.add(function (e, t) {
            var i = a._getItemText(e), s = !0;
            if ("click" == t.type) {
                t.preventDefault();
                var r = $(t.target);
                if (r.closest("a.del-item-link").length > 0 && (s = !1, h.remove(i), a._rerender()), r.closest("a.suggest-link").length > 0) {
                    s = !1;
                    var n = r.prop("href"), o = $("#suggest-link");
                    o.length ? o.prop("href", n) : ($dom = $('<a id="suggest-link" href="' + n + '" target="_blank" />'), $("body").append($dom), o = $("#suggest-link"));
                    var c = r.prev(".suggest-text").hasClass("hot"), l = {
                        eid: "click/search/quicketr/",
                        eid_desc: "\u70b9\u51fb/\u641c\u7d22/\u5feb\u901f\u5165\u53e3/"
                    };
                    c ? (l.eid += "hotword", l.eid_desc += "\u70ed\u641c") : (l.eid += "associate", l.eid_desc += "\u8054\u60f3");
                    try {
                        ya.reportProductEvent({eid: l.eid, eid_desc: l.eid_desc})
                    } catch (t) {
                    }
                    o[0].click()
                }
            }
            s && a.onItemSelect.fire(e, t, i)
        }), this.onItemSelect.add(function (t, i, s) {
            "click" == i.type && (a.val(s), e.closest("form").submit())
        }), this.onNav.add(function (t) {
            t && e.val(a._getItemText(t))
        }), e.on("focus", function () {
            a._rerender()
        })
    }, t, {
        _getItemText: function (e) {
            var t = e.data("sug-item") || "";
            return "string" == typeof t ? t : t.toString()
        }, initWrapper: function () {
            if (!this.jqSug) {
                t.prototype.initWrapper.call(this);
                var e = this;
                this.jqSug.on("click", "a.clear-his-btn", function (t) {
                    t.preventDefault(), h.clear(), e._rerender()
                })
            }
        }, render: function (e, i) {
            t.prototype.render.call(this, e, i), this.initItems(), e.history.length > 0 || e.suggest.length > 0 ? this.show() : this.hide()
        }, _rerender: function () {
            var e = this;
            setTimeout(function () {
                var t = e.val();
                e.dataSource(t, function (i) {
                    i && (e.dataCache[t] = i, e.val() === t && e.render(i, t))
                })
            }, 0)
        }
    })
}(), function () {
    var e = '@charset "UTF-8";.header-search-tips{position:relative;width:250px;background-color:#fff;border:1px solid #e0e0e0;font-size:12px;box-shadow:0 3px 8px 2px rgba(1,1,1,.1);border-radius:5px}.header-search-tips li{line-height:30px;height:30px;color:#666;overflow:hidden;cursor:pointer;padding:0 15px}.header-search-tips li:hover{color:#f90;background-color:#ececec}.header-search-tips .his-items em{width:14px;height:14px;text-align:center;line-height:14px;display:inline-block;background:url(https://a.msstatic.com/huya/main/img/header/sprite/search_icon_b4d8025.png);margin-right:8px;vertical-align:middle;*display:inline;*zoom:1}.header-search-tips .his-items .del-item-link{float:right;padding:0 5px;height:30px;margin-right:-5px}.header-search-tips .his-items .del-item-link span{display:inline-block;*display:block;*margin-top:12px;vertical-align:middle;width:8px;height:7px;background:url(https://a.msstatic.com/huya/main/img/header/sprite/search_clear_69b8269.png?__sprite);text-indent:-9999em}.header-search-tips .clear-his-btn{display:block;margin:6px 15px 8px;font-size:12px;line-height:28px;border-radius:14px;color:#555;background:#F1F2F4;text-align:center;text-decoration:none}.header-search-tips .clear-his-btn i{padding-left:5px;font-family:\\5b8b\\4f53}.header-search-tips .clear-his-btn:hover{text-decoration:none;background:#ff9600;color:#fff}.header-search-tips .his-items-line{height:0;border-bottom:1px solid #e6e6e6;margin-bottom:6px}.header-search-tips .search-items{padding-bottom:7px}.header-search-tips .search-items em{width:16px;height:16px;text-align:center;line-height:16px;font-size:12px;display:inline-block;*display:inline;*zoom:1;background:#d8d8d8;color:#666;border-radius:8px;margin-right:8px}.header-search-tips .search-items em.top-item{background:#ff6d00;color:#fff}.header-search-tips .search-item-hover{color:#666;background-color:#ececec}.header-search-tips .search-item-hover .suggest-text{width:7em}.header-search-tips .search-item-hover .suggest-text.hot{width:7em}.header-search-tips .search-item-hover .suggest-link{display:block}.header-search-tips .suggest-text{display:inline-block;vertical-align:top;width:100%;height:30px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap}.header-search-tips .suggest-text.hot{width:12em}.header-search-tips .suggest-link{display:none;float:right;color:#f90}.header-search-tips .suggest-link:hover{cursor:pointer;color:#f90}';
    HUYA_UTIL.createStyleSheet(e);
    var t = $("#searchForm_id").find("input"), i = new SearchSuggest(t, {
        wrapper: '<div class="header-search-tips"></div>',
        container: $("#J_hyhdss")
    });
    i.compiledTemplate = _.template(i.options.template), t.closest("form").on("submit", function (e) {
        return "" == $.trim(t.val()) && "placeholder" in t[0] && t.val(t[0].placeholder), "" == $.trim(t.val()) ? void e.preventDefault() : void i.historyData.add(i.val())
    })
}();