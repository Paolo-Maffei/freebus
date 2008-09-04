/***************************************************************
* Copyright notice
*
* (c) 2008 Sven Braun <info@sb-computer.eu> 
* All rights reserved
****************************************************************
* knxView
* @author: Sven Braun
***************************************************************/

Ext.onReady(function(){
	Ext.QuickTips.init();
	var version = "0.1.2"
	Ext.get(document.body).update('<div id="header"><h1>KNXview '+version+'</h1></div><div id="navigation"></div><div id="navigationOLD"></div><div id="test"></div><br />');
	document.title = "KNXview - Die Freebus KNX Visualisierung " + version;
	
//##################################################################	
//*** Navigation Panel
//##################################################################
	 var treePanel = new Ext.tree.TreePanel({
    	renderTo: 'navigation',
		width: '200px',
		id: 'tree-panel',
    	title: 'Navigation',
        //split: true,
        height: 300,
        minSize: 150,
        autoScroll: true,
        
        // tree-specific configs:
        rootVisible: false,
        lines: false,
        singleExpand: true,
        useArrows: true,
        
        loader: new Ext.tree.TreeLoader({
            dataUrl:'navigation.json'
        }),
        
        root: new Ext.tree.AsyncTreeNode()
    });
	
	
	new Ext.Panel({
		renderTo: 'navigationOLD',
		width: '200px',
		title: 'Navigation',
		//html: 'hier steht jetzt der HTML Content!',
		collapsible: true,
		items: [{
			xtype: 'button',
			text: 'Cron Editor',
			handler: function(){
				CronGridWindow.show();
			}
		},{
			xtype: 'button',
			text: 'GA Editor',
			handler: function(){
				StatusGridWindow.show();
			}
		}]
	});
	
//##################################################################	
//*** Neues Panel	
//##################################################################
	new Ext.Panel({
		renderTo: 'test',
		width: '200px',
		title: 'Büro',
		//html: 'hier steht jetzt der HTML Content!',
		collapsible: true,
		items: [{
			xtype: 'button',
			text: 'Licht an',
			handler: function(){
				Ext.Ajax.request({   
					waitMsg: 'Schalte Licht ein...',
					url: '/cgi-bin/fbvisu/fbSend.php',
					params:{GA: "1/4/7", state: "1"}
				})
			}
		},{
			xtype: 'button',
			text: 'Licht aus',
			handler: function(){
				Ext.Ajax.request({   
					waitMsg: 'Schalte Licht ein...',
					url: '/cgi-bin/fbvisu/fbSend.php',
					params:{GA: "1/4/7", state: "0"}
				})
			}
		},{
			xtype: 'button',
			text: 'Licht Toggle',
			handler: function(){
				Ext.Ajax.request({   
					waitMsg: 'Toggle Licht...',
					url: '/cgi-bin/fbvisu/fbSend.php',
					params:{GA: "1/4/7", state: "TOGGLE"}
				})
			}
		}]
	});

});