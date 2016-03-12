<%@ Control Language="C#" AutoEventWireup="true" CodeFile="TabsControl.ascx.cs" Inherits="TabsControl" %>

<!-- NOTE: Containing page must include jquery script reference. -->
<script type="text/javascript">
    var tabIdPrefix = "<%=TAB_ID_PREFIX %>";
    
    var <%= this.ID %> = new (function () {
        function SetTabVisibility(Tab, Visible) {
            if (typeof Tab != "undefined") {
                if (Visible) {
                    $(Tab).show();
                }
                else {
                    $(Tab).hide();
                }
            }
        }

        this.GetTabArrayInstance = function() {
            return $("ul[id='<%= this.ID %>']");
        }

        this.GetTabByIndex = function(TabIndex) {
            var tabContainer = this.GetTabArrayInstance();
            var tab = tabContainer.find("li[id='<%= this.ID %>_" + tabIdPrefix + TabIndex + "']");
            return tab;
        }

        this.GetTabByText = function(TabText) {
            var tabContainer = this.GetTabArrayInstance();
            var tabToGet;

            tabContainer.children().each(function(index) {
                if ($(this).text().toUpperCase() == TabText.toUpperCase()) {
                    tabToGet = $(this);
                }
            });

            return tabToGet;
        }

        this.SetActiveTab = function(ActiveTabIndex) {
            var tabContainer = this.GetTabArrayInstance();
            tabContainer.children().each(function(index) {
                var currentTabIndex = $(this).attr("id").split(tabIdPrefix)[1];
                if (currentTabIndex == ActiveTabIndex) {
                    $(this).addClass("active-tab");
                }
                else {
                    $(this).removeClass("active-tab");
                }
            });
        }

        this.ShowTabArray = function() {
            this.GetTabArrayInstance().show();
        }

        this.HideTabArray = function() {
            this.GetTabArrayInstance().hide();
        }

        this.ShowTabByIndex = function(TabIndex) {
            var tab = this.GetTabByIndex(TabIndex);
            SetTabVisibility(tab, true);
        }

        this.HideTabByIndex = function(TabIndex) {
            var tab = this.GetTabByIndex(TabIndex);
            SetTabVisibility(tab, false);
        }

        this.ShowTabByText = function(TabText) {
            var tab = this.GetTabByText(TabText);
            SetTabVisibility(tab, true);
        }

        this.HideTabByText = function(TabText) {
            var tab = this.GetTabByText(TabText);
            SetTabVisibility(tab, false);
        }

        this.ClickTab = function(TabIndex) {
            var tab = this.GetTabByIndex(TabIndex);
            if (typeof tab != "undefined") {
                $(tab).click();
            }
        }

        this.ClickTabByText = function(TabText) {
            var tab = this.GetTabByText(TabText);
            if (typeof tab != "undefined") {
                $(tab).click();
            }
        }
    })();
</script>

<%= BuildTabArray() %>
