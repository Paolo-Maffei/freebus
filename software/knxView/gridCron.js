/***************************************************************
* Copyright notice
*
* (c) 2008 Sven Braun <info@sb-computer.eu> 
* All rights reserved
****************************************************************
* knxView
* @author: Sven Braun
***************************************************************/

//##################################################################
// Cronjob Editor GRID
//##################################################################  

	var Cronjob = Ext.data.Record.create([
			{name: 'ID', type: 'int'},
			{name: 'Minute', type: 'string'},
			{name: 'Stunde', type: 'string'},
			{name: 'Tag', type: 'string'},
			{name: 'Monat', type: 'string'},
			{name: 'Wochentag', type: 'string'},
			{name: 'Befehl', type: 'string'},
			{name: 'Beschreibung', type: 'string'}
      ]);
	  
    var cm2 = new Ext.grid.ColumnModel([
		{header: "ID", dataIndex: 'ID', width: 20, hidden: true}, 
		{header: "Minute", dataIndex: 'Minute', width: 50, sortable: true, editor:new Ext.form.TextField()},
		{header: "Stunde", dataIndex: 'Stunde', width: 50, sortable: true},
		{header: "Tag", dataIndex: 'Tag', width: 30, sortable: true},
		{header: "Monat", dataIndex: 'Monat', width: 50, sortable: true},
		{header: "Wochentag", dataIndex: 'Wochentag', width: 70, sortable: true, editor: new Ext.form.ComboBox({
			typeAhead: true,
			triggerAction: 'all',
			store:new Ext.data.SimpleStore({
				fields:['weekdayValue', 'weekdayName'],
				data: [['*','Alle'],['1-5','Wochentag'],['0,6','Wochenende'],['0','Sonntag'],['1','Montag'],['2','Dienstag'],['3','Mittwoch'],['4','Donnerstag'],['5','Freitag'],['6','Samstag']]
            }),
			mode: 'local',
			displayField: 'weekdayName',
			valueField: 'weekdayValue'
			//listClass: 'x-combo-list-small'
		}) },
		{header: "Befehl", dataIndex: 'Befehl', width: 300, sortable: true},
		{header: "Beschreibung", dataIndex: 'Beschreibung', width: 350, sortable: true}
    ]);
  
	var store2 = new Ext.data.JsonStore({
		id: 'name',
		totalProperty:'totalCount',
		root:'data',
		url:'cgi-bin/cronjob-get.php',
		baseParams:{task: "SHOW"}, 
		fields:[
			{name: 'ID', mapping: 'ID', type: 'int'},
			{name: 'Minute', mapping: 'Minute', type: 'string'},
			{name: 'Stunde', mapping: 'Stunde', type: 'string'},
			{name: 'Tag', mapping: 'Tag', type: 'string'},
			{name: 'Monat', mapping: 'Monat', type: 'string'},
			{name: 'Wochentag', mapping: 'Wochentag', type: 'string'},
			{name: 'Befehl', mapping: 'Befehl', type: 'string'},
			{name: 'Beschreibung', mapping: 'Beschreibung', type: 'string'}
		]
	});

	var cron = new Ext.grid.EditorGridPanel({
        //title: 'Crontab Editor',
		store: store2,
        cm: cm2,
		selModel: new Ext.grid.RowSelectionModel({singleSelect:false}),		// Immer ganze Zeile auswählen
        //renderTo:'cron',
        width:580,
		autoHeight: true,
		//frame:true,
		collapsible: true,
		//collapsed: true,
		clicksToEdit:2,
		tbar: [{
            text: 'Add',
			tooltip: 'Erstellen eines neuen Cronjobs',
			iconCls: 'icon-add',
            handler : showAddCronjobWindow
        },'-',{
            text: 'Delete',
			tooltip: 'Den markierten Cronjob löschen.',
			iconCls: 'icon-delete',
			handler: confirmDeleteCronjob

        },'->',{
	    	text: 'Refresh',
			tooltip: 'Das GRID aktualisieren.',
			iconCls: 'icon-refresh',
			handler: function() {
				cron.store.reload();
				//Ext.example.msg('Click','Das Grid wurde neugeladen');
			}
	    }],
		listeners: {
	  	render: function(){
			this.store.load();
	   	}
	}
    });
	
	
	// Add new Cronjob
	
	var cMinute = new Ext.form.TextField({
		id: 'cMinute',
		fieldLabel: 'Minute',
		maxLength: 20,
		allowBlank: false,
		anchor : '95%',
		maskRe: /([0-9\s\,\-\*]+)$/
	});
	var cStunde = new Ext.form.TextField({
		id: 'cStunde',
		fieldLabel: 'Stunde',
		maxLength: 20,
		allowBlank: false,
		anchor : '95%',
		maskRe: /([0-9\s\,\-\*]+)$/
	});
	var cTag = new Ext.form.TextField({
		id: 'cTag',
		fieldLabel: 'Tag',
		maxLength: 20,
		allowBlank: false,
		anchor : '95%',
		maskRe: /([0-9\s\,\-\*]+)$/
	});
	var cMonat = new Ext.form.TextField({
		id: 'cMonat',
		fieldLabel: 'Monat',
		maxLength: 20,
		allowBlank: false,
		anchor : '95%',
		maskRe: /([0-9\s\,\-\*]+)$/
	});
	var cWochentag = new Ext.form.TextField({
		id: 'cWochentag',
		fieldLabel: 'Wochentag',
		maxLength: 20,
		allowBlank: false,
		anchor : '95%',
		maskRe: /([0-9\s\,\-\*]+)$/
	});
	var cBefehl = new Ext.form.TextField({
		id: 'cBefehl',
		fieldLabel: 'Befehl',
		maxLength: 100,
		allowBlank: false,
		anchor : '95%'
	});
	var cBeschreibung = new Ext.form.TextField({
		id: 'cBeschreibung',
		fieldLabel: 'Beschreibung',
		maxLength: 100,
		allowBlank: false,
		anchor : '95%'
	});
	var cGA = new Ext.form.TextField({
		id: 'cGA',
		fieldLabel: 'Gruppenadresse',
		maxLength: 8,
		allowBlank: false,
		maskRe: /([0-9/])$/,		// Nur Zahlen und den Slash zulassen
		anchor : '95%'
	});
	var cState = new Ext.form.TextField({
		id: 'cState',
		fieldLabel: 'Status',
		maxLength: 1,
		allowBlank: false,
		maskRe: /([0-1])$/,		// Nur 0 und 1 zulassen
		anchor : '95%'
	});
	
	addCronjobForm = new Ext.FormPanel({
        labelAlign: 'top',
        bodyStyle:'padding:5px',
        width: 600,        
        items: [{
            layout:'column',
            border:false,
            items:[{
                columnWidth:0.5,
                layout: 'form',
                border:false,
                items: [cMinute, cStunde, cTag, cBeschreibung]
            },{
                columnWidth:0.5,
                layout: 'form',
                border:false,
                items: [cMonat, cWochentag, cGA, cState]
            }]
        }],
		buttons: [{
			text: 'Speichern',
			handler: addCronjob
		},{
			text: 'Abbrechen',
			handler: function(){
				// because of the global vars, we can only instantiate one window... so let's just hide it.
				addCronjobWindow.hide();
			}
		}]
    });
  
  addCronjobWindow = new Ext.Window({
      id: 'addCronjobWindow',
      title: 'Neuen Cronjob erstellen.',
      closable:true,
      width: 610,
      height: 300,
      plain:true,
      layout: 'fit',
      items: addCronjobForm
    });
	
	
	// Form zurücksetzen, bevor sie geöffnet wird
	function cleanCronjobForm(){
		cMinute.setValue('');
		cStunde.setValue('');
		cTag.setValue('');
		cMonat.setValue('');
		cWochentag.setValue('');
		//cBefehl.setValue('');
		cGA.setValue('');
		cState.setValue('');
		cBeschreibung.setValue('');
	}

	// check if the form is valid
	function isCrontabFormValid(){
		return(cMinute.isValid() && cStunde.isValid() && cTag.isValid() && cMonat.isValid() && cWochentag.isValid() && cGA.isValid() && cState.isValid()&& cBeschreibung.isValid());
	}
  
	// display or bring forth the form
	function showAddCronjobWindow(){
		if(!addCronjobWindow.isVisible()){
			cleanCronjobForm();
			addCronjobWindow.show();
		} else {
			addCronjobWindow.toFront();
		}
	}
	
	function addCronjob(){
		if(isCrontabFormValid()){
			Ext.Ajax.request({   
				waitMsg: 'Bitte warten...',
				url: 'cgi-bin/cronjob-get.php',
				params: {
					task: "ADD",
					Minute:		cMinute.getValue(),
					Stunde:		cStunde.getValue(),
					Tag:		cTag.getValue(),
					Monat:		cMonat.getValue(),
					Wochentag:	cWochentag.getValue(),
					GA:			cGA.getValue(),
					state:		cState.getValue(),
					Beschreibung:		cBeschreibung.getValue()
					//Befehl:		cBefehl.getValue()
				}, 
				success: function(response){              
					var result=eval(response.responseText);
					switch(result){
						case 1:
							addCronjobWindow.hide();
							Ext.MessageBox.alert('Erfolgreich','Der Cronjob wurde erfolgreich erstellt.');
							store2.reload();
						break;
						default:
							Ext.MessageBox.alert('Achtung','Der Cronjob konnte nicht erstellt werden.');
						break;
					}
				},
				failure: function(response){
					var result=response.responseText;
					Ext.MessageBox.alert('Fehler','Das System konnte den Cronjobfile nicht erreichen');          
				}                      
			});
		} else {
			Ext.MessageBox.alert('Warnung', 'Die Form ist nicht valid!');
		}
	}

	//+++ Cronjob löschen
	function deleteCron(btn) {
		if(btn == 'yes'){
			var auswahl = cron.selModel.getSelections();
			var arrCron = [];
			
			for(i = 0; i< cron.selModel.getCount(); i++){
				arrCron.push(auswahl[i].json.ID);
			}
						var encoded_array = Ext.encode(arrCron);
			
			Ext.Ajax.request({  
				waitMsg: 'Bitte warten...',
				url: 'cgi-bin/cronjob-get.php',
				params: { 
					task: "DELETE", 
					ids: encoded_array
				}, 
				success: function(response){
					var result=eval(response.responseText);
					switch(result){
						case 1:		// Löschen erfolgreich, Grid neuladen
						store2.reload();
						break;
						default:
						Ext.MessageBox.alert('Warnung','Die ausgewählten Einträge konnten nicht gelöscht werden.');
						break;
					}
				},
				failure: function(response){
					var result=response.responseText;
					Ext.MessageBox.alert('Fehler','Die Datenbank konnte nicht erreicht werden. Bitte versuchen Sie es später noch einmal.');      
				}
			});
		}  
	}
	
	function confirmDeleteCronjob() {
		if(cron.selModel.getCount() == 1) {	// Wenn nur ein Cronjob markiert ist
			Ext.MessageBox.confirm('Bestätigung','Diesen Cronjob wirklich löschen ?', deleteCron);
		} else if(cron.selModel.getCount() > 1){
			Ext.MessageBox.alert('Fehler','Es kann immer nur 1 Cronjob gelöscht werden.');
		} else {
			Ext.MessageBox.alert('Fehler','Es kann kein Cronjob gelöscht werden, da Sie keinen markiert haben!');
		}
	}

//##################################################################
// Fenster erzeugen
//##################################################################  

	var CronGridWindow = new Ext.Window({
		id: 'CronGridWindow',
		title: 'Crontab Editor',
		x: 300,
		y: 100,
		closable: true,
		width: 900,
		height: 300,
		plain: true,
		layout: 'fit',
		items: [cron]
	});