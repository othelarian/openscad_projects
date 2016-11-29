# craft addon

# imports #######################

import bpy
import os
import subprocess
from bpy.props import StringProperty,CollectionProperty
from bpy.types import Operator,OperatorFileListElement
from bpy_extras.io_utils import ImportHelper

# bl info #######################

bl_info = {
    "name": "laser craft addon",
    "author": "othelarian",
    "version": (1,0),
    "blender": (2,7,8),
    "category": "Import-Export"
}

# operators #####################

class OP_craft_import(Operator,ImportHelper):
    bl_label = "Import craft"
    bl_idname = "craft.import"
    bl_options = {"UNDO"}

    fimename_ext = ".scad"
    filter_glob = StringProperty(default = "*.scad",options = {"HIDDEN"})
    files = CollectionProperty(name="File Path",type=OperatorFileListElement)
    directory = StringProperty(subtype = "DIR_PATH")

    def execute(self,context):
        paths = [os.path.join(self.directory,name.name) for name in self.files]
        for file in paths:
            res = parse_file(file)
            if res > 0:
                for id in range(res):
                    res = generate_object(file,id)
                    if not res:
                        self.report({"ERROR"},"Error in the scad conversion phase")
                        return {"CANCELLED"}
            else:
                return {"CANCELLED"}
        return {"FINISHED"}

# functions #####################

def parse_file(file):
    f = open(file,'r')
    for line in f:
        if line.startswith("//nb pieces :"):
            return int(line.split(" ")[-1])
    return 0
    f.close()

def generate_object(file,id):
    target = file[:-4]+"stl"
    try:
        args = ["openscad","-o",target,"-D","ext_id="+str(id),file]
        subprocess.run(args)
    except Exception as e:
        print(e)
        return False
    bpy.ops.import_mesh.stl(filepath=target,global_scale=0.1)
    os.remove(target)
    return True

def menu_import(self,context):
    self.layout.operator(OP_craft_import.bl_idname,text="Laser craft")

# register / unregister #########

def register():
    bpy.utils.register_class(OP_craft_import)
    bpy.types.INFO_MT_file_import.append(menu_import)

def unregister():
    bpy.utils.unregister_class(OP_craft_import)
    bpy.types.INFO_MT_file_import.remove(menu_import)

if __name__ == "__main__":
    register()
