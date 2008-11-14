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
	var version = "0.1.3"
	//Ext.get(document.body).update('<div id="header"><h1>KNXview '+version+'</h1></div><div id="navigation"></div><div id="navigationOLD"></div><div id="test"></div><br />');
	Ext.get(header).update('<h1>KNXview '+version+'</h1>');
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
            dataUrl:"cgi-bin/navigation.php"
        }),
        
        root: new Ext.tree.AsyncTreeNode()
    });
	// Wenn auf den Tree geklickt wird, führe folgendes Event aus !
	treePanel.on('click', function(node){
	 if(node.leaf) {
		switch(node.id){
			case "CronGridWindow": 		CronGridWindow.show();
										break;
									
			case "StatusGridWindow": 	StatusGridWindow.show();
										break;
									
			case "EtsImportWindow": 	EtsImportWindow.show();
										break;
			
			default: msg("Achtung", "Diese Funktion ist noch nicht definiert.");
		
    	}
	 }
    });




//##################################################################	
//*** Altes Navigation Panel
//##################################################################
	new Ext.Panel({
		//renderTo: 'navigationOLD',
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
		},{
			xtype: 'button',
			text: 'ETS import',
			handler: function(){
				EtsImportWindow.show();
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
					url: '/cgi-bin/knxSend.php',
					params:{GA: "1/4/7", state: "1"}
				})
			}
		},{
			xtype: 'button',
			text: 'Licht aus',
			handler: function(){
				Ext.Ajax.request({   
					waitMsg: 'Schalte Licht ein...',
					url: '/cgi-bin/knxSend.php',
					params:{GA: "1/4/7", state: "0"}
				})
			}
		},{
			xtype: 'button',
			text: 'Licht Toggle',
			handler: function(){
				Ext.Ajax.request({   
					waitMsg: 'Toggle Licht...',
					url: '/cgi-bin/knxSend.php',
					params:{GA: "1/4/7", state: "TOGGLE"}
				})
			}
		}]
	});


//##################################################################	
//*** ETS import Window
// Achtung; In der php.ini muss
// 		1. file_uploads = On
// 		2. upload_tmp_dir muss in der php.ini gesetzt sein
//##################################################################	
	var fp = new Ext.FormPanel({
        fileUpload: true,
        width: 400,
        frame: true,
        autoHeight: true,
        bodyStyle: 'padding: 10px 10px 0 10px;',
        labelWidth: 50,
        defaults: {
            anchor: '95%',
            allowBlank: false,
            msgTarget: 'side'
        },
        items: [{
            xtype: 'fileuploadfield',
            id: 'form-file',
            emptyText: 'ETS Datei auswählen (cvs)',
            fieldLabel: 'Datei',
            name: 'file',
			type: 'cvs',
            buttonCfg: {
                text: '',
                iconCls: 'icon-upload'
            }
        }],
        buttons: [{
            text: 'Speichern',
			iconCls: 'icon-save',
            handler: function(){
                if(fp.getForm().isValid()){
	                fp.getForm().submit({
						name: 'etsimport.cvs',
	                    url: 'cgi-bin/file-upload.php',
	                    waitMsg: 'Die ETS Datei wird in die Datenbank eingelesen...',
	                    success: function(fp, o){
	                        msg('Erfolgreich', o.result.message);
	                    },
						failure: function(fp, o){
	                        msg('Fehler', o.result.message);
	                    }
	                });
                }
            }
        },{
            text: 'Reset',
            handler: function(){
                fp.getForm().reset();
            }
        }]
    });
	
	
	var EtsImportWindow = new Ext.Window({
		id: 'EtsImportWindow',
		title: 'ETS Import',
		autoHeight: true,
		closable: true,
		plain: true,
		layout: 'fit',
		items: [fp]
	});
	
//##################################################################	
//*** ETS MessageBox
//##################################################################		
	var msg = function(title, msg){
        Ext.Msg.show({
            title: title, 
            msg: msg,
            minWidth: 200,
            modal: true,
            icon: Ext.Msg.INFO,
            buttons: Ext.Msg.OK
        });
    };	
// END	
});