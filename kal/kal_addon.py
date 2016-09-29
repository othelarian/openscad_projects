bl_info = {
    "name": "kal addon",
    "author": "othelarian",
    "version": (0,1),
    "blender": (2,77)
}

import bpy
import os
from pathlib import Path
import subprocess

class PANEL_kal_main(bpy.types.Panel):
    bl_space_type = "VIEW_3D"
    bl_region_type = "TOOLS"
    bl_label = "Kal addon"
    bl_category = "Kal"

    def draw(self,context):
        layout = self.layout
        cs = context.scene
        row = layout.row()
        row.label("Dirs list :")
        row = layout.row()
        row.template_list(
            "kal.list","kal.dir_list",cs,"kal_dirs_list",
            cs,"kal_dir_active","",2
        )
        row = layout.row()
        row.label("Pieces list :")
        row = layout.row()
        row.template_list(
            "kal.list","kal.pieces_list",cs,"kal_pieces_list",
            cs,"kal_piece_active","",2
        )
        row = layout.row()
        row.prop(cs,"kal_scale",text="import scale :")
        row = layout.row()
        row.operator("kal.refresh")
        row.operator("kal.generate")

class OPERATOR_kal_refresh(bpy.types.Operator):
    bl_label = "Refresh"
    bl_idname = "kal.refresh"
    bl_options = {"UNDO"}

    def execute(self,context):
        cs = context.scene
        lst_res = bpy.utils.blend_paths(absolute=True)
        for pth in lst_res:
            if pth[-12:] == "kal_addon.py":
                cs.kal_abspath = os.path.dirname(pth)
                break
        lst_dirs = sorted(os.listdir(cs.kal_abspath))
        cs.kal_dirs_list.clear()
        for elt in lst_dirs:
            if not elt == "kal_addon.py" and not elt[-4:] == ".stl":
                item = cs.kal_dirs_list.add()
                item.name = elt
        if cs.kal_dir_active > (len(lst_dirs)-2):
            cs.kal_dir_active = 0
        check_dir_active(None,context)
        return {"FINISHED"}

class OPERATOR_kal_generate(bpy.types.Operator):
    bl_label = "Generate"
    bl_idname = "kal.generate"
    bl_options = {"UNDO"}

    def execute(self,context):
        cs = context.scene
        # clear old buggy stl
        lst_files = os.listdir(cs.kal_abspath)
        for elt in lst_files:
            if elt[-4:] == ".stl":
                os.remove(os.path.join(cs.kal_abspath,elt))
        # get the input file
        act_dir = cs.kal_dirs_list[cs.kal_dir_active].name
        act_piece = cs.kal_pieces_list[cs.kal_piece_active].name
        input = os.path.join(cs.kal_abspath,act_dir,(act_piece+".scad"))
        target = os.path.join(cs.kal_abspath,(act_piece+".stl"))
        if not Path(input).exists():
            self.report({"ERROR"},"The scad file doesn't exists ! Please refresh !")
            return {"CANCELLED"}
        try:
            args = ["openscad","-o",target,"-D","ext_scale="+str(cs.kal_scale),input]
            subprocess.run(args)
        except Exception as e:
            print(e)
            self.report({"ERROR"},"Error in conversion from scad to stl")
            return {"CANCELLED"}
        # import the stl file
        bpy.ops.import_mesh.stl(filepath=target,global_scale=0.1)
        # clean
        os.remove(target)
        return {"FINISHED"}

class LIST_kal_list(bpy.types.UIList):
    bl_idname = "kal.list"

    def draw_item(self,context,layout,data,item,icon,active_data,active_propname):
        slot = item
        if self.layout_type in {"DEFAULT","COMPACT"}:
            layout.label(text=slot.name)
        elif self.layout_type in {"GRID"}:
            pass

class PROPS_kal_dirs_list(bpy.types.PropertyGroup):
    name = bpy.props.StringProperty()

class PROPS_kal_pieces_list(bpy.types.PropertyGroup):
    name = bpy.props.StringProperty()

def check_dir_active(self,context):
    cs = context.scene
    cs.kal_pieces_list.clear()
    act_dir = cs.kal_dirs_list[cs.kal_dir_active].name
    abs_dir = os.path.join(cs.kal_abspath,act_dir)
    lst_files = sorted(os.listdir(abs_dir))
    for file in lst_files:
        item = cs.kal_pieces_list.add()
        item.name = file[:-5]

def register():
    #panels
    bpy.utils.register_class(PANEL_kal_main)
    #operators
    bpy.utils.register_class(OPERATOR_kal_refresh)
    bpy.utils.register_class(OPERATOR_kal_generate)
    #lists
    bpy.utils.register_class(LIST_kal_list)
    #properties
    bpy.utils.register_class(PROPS_kal_dirs_list)
    bpy.utils.register_class(PROPS_kal_pieces_list)
    bpy.types.Scene.kal_abspath = bpy.props.StringProperty()
    bpy.types.Scene.kal_dirs_list = bpy.props.CollectionProperty(
        type=PROPS_kal_dirs_list)
    bpy.types.Scene.kal_pieces_list = bpy.props.CollectionProperty(
        type=PROPS_kal_pieces_list)
    bpy.types.Scene.kal_dir_active = bpy.props.IntProperty(
        update=check_dir_active)
    bpy.types.Scene.kal_piece_active = bpy.props.IntProperty()
    bpy.types.Scene.kal_scale = bpy.props.FloatProperty(default=1,min=0)

def unregister():
    #panels
    bpy.utils.unregister_class(PANEL_kal_main)
    #operators
    bpy.utils.unregister_class(OPERATOR_kal_refresh)
    bpy.utils.unregister_class(OPERATOR_kal_generate)
    #lists
    bpy.utils.unregister_class(LIST_kal_list)
    #properties
    bpy.utils.unregister_class(PROPS_kal_dirs_list)
    bpy.utils.unregister_class(PROPS_kal_pieces_list)
    del bpy.types.Scene.kal_abspath
    del bpy.types.Scene.kal_dirs_list
    del bpy.types.Scene.kal_pieces_list
    del bpy.types.Scene.kal_dir_active
    del bpy.types.Scene.kal_piece_active
    del bpy.types.Scene.kal_scale

if __name__ == "__main__":
    register()
