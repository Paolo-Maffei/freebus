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
// *** EIB Status Grid
//##################################################################	
	var Aktor = Ext.data.Record.create([
			{name: 'ID', type: 'int'},
			{name: 'Name', type: 'string'},
			{name: 'GA', type: 'string'},
			{name: 'State', type: 'int'}
      ]);
	  
    // Column Model
	var cm = new Ext.grid.ColumnModel([
		{header: "ID", dataIndex: 'ID', width: 20, hidden: true},
		{header: "Name", dataIndex: 'Name', width: 100, sortable: true, 
		 editor: new Ext.form.TextField({allowBlank: false}) },
		
		{header: "GA", dataIndex: 'GA', width: 70, sortable: true,
			editor: new Ext.form.TextField({
				allowBlank: false,
				maxLength: 8,
				maskRe: /([0-9/])$/
          })
		},
		
		{header: "State", dataIndex: 'State', width: 40, sortable: true,
			editor: new Ext.form.NumberField({
				allowBlank: false,
				blankText: '0',
				maxLength: 1,
				maskRe: /([0-1])$/
			})
		}
    ]);
	//store
	var store = new Ext.data.JsonStore({
		id: 'state_store',
		totalProperty:'totalCount',
		root:'data',
		url:'cgi-bin/fbvisu/jsonstate.php',
		baseParams:{task: "SHOW"}, 
		fields:[
			{name: 'ID', mapping: 'ID', type: 'int'},
			{name: 'Name', mapping: 'Name', type: 'string'},
			{name: 'GA', mapping: 'GA', type: 'string'},
			{name: 'State', mapping: 'State', type: 'int'}
		]
	});

  var grid = new Ext.grid.EditorGridPanel({
        //title: 'EIB Status Grid',
		id: 'StatusEditorGrid',
		store: store,
        cm: cm,
		selModel: new Ext.grid.RowSelectionModel({singleSelect:false}),		// Immer ganze Zeile auswählen
        //renderTo:'grid',
        width:400,
        height:400,
		//frame:true,
		//collapsible: true,
		//collapsed: true,
		clicksToEdit:2,
		tbar: [{
            text: 'Add',
			iconCls: 'icon-add',
            handler : function(){
                var a = new Aktor({
                    Name: 'Unbekannt',
                    GA: '0/0/0',
                    State: 0,
                });
                grid.stopEditing();
                store.insert(0, a);
                grid.startEditing(0, 0);
            }
        },'->',{
	    	text: 'Refresh',
			iconCls: 'icon-refresh',
			handler: function() {
				grid.store.reload();
				//Ext.example.msg('Click','Das Grid wurde neugeladen');
			}
	    }],
		listeners: {
	  	render: function(){
			this.store.load();
	   	}
	}
    });
	// Observers :-)
	grid.on('afteredit', saveStateGrid);


	function saveStateGrid(oGrid_event){
		Ext.Ajax.request({   
			waitMsg: 'Bitte warten...',
			url:'cgi-bin/fbvisu/jsonstate.php',
			params: {
				task: "UPDATE",
				ID: oGrid_event.record.data.ID,
				Name: oGrid_event.record.data.Name,
				GA: oGrid_event.record.data.GA,
				State: oGrid_event.record.data.State
			},
			success: function(response){							
				var result=eval(response.responseText);
				switch(result){
				case 1:
				store.commitChanges();   // changes successful, get rid of the red triangles
				store.reload();          // reload our datastore.
				break;					
				default:
				Ext.MessageBox.alert('Fehler:','Der Datensatz konnte nicht gespeichert werden.');
				break;
				}
			},
			failure: function(response){
				var result=response.responseText;
				Ext.MessageBox.alert('Fehler','Ein Systemfehler ist aufgetreten. Bitte versuchen Sie es später noch einmal.');		
			}									    
		});   
	}
	
//##################################################################
// Fenster erzeugen
//##################################################################  

	var StatusGridWindow = new Ext.Window({
		id: 'StatusGridWindow',
		title: 'Eingetragene Aktoren',
		x: 300,
		y: 100,
		closable: true,
		width: 300,
		height: 400,
		plain: true,
		layout: 'fit',
		items: [grid]
	});