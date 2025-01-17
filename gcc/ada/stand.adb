------------------------------------------------------------------------------
--                                                                          --
--                         GNAT COMPILER COMPONENTS                         --
--                                                                          --
--                                S T A N D                                 --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
--          Copyright (C) 1992-2014,  Free Software Foundation, Inc.        --
--                                                                          --
-- GNAT is free software;  you can  redistribute it  and/or modify it under --
-- terms of the  GNU General Public License as published  by the Free Soft- --
-- ware  Foundation;  either version 3,  or (at your option) any later ver- --
-- sion.  GNAT is distributed in the hope that it will be useful, but WITH- --
-- OUT ANY WARRANTY;  without even the  implied warranty of MERCHANTABILITY --
-- or FITNESS FOR A PARTICULAR PURPOSE.                                     --
--                                                                          --
-- As a special exception under Section 7 of GPL version 3, you are granted --
-- additional permissions described in the GCC Runtime Library Exception,   --
-- version 3.1, as published by the Free Software Foundation.               --
--                                                                          --
-- You should have received a copy of the GNU General Public License and    --
-- a copy of the GCC Runtime Library Exception along with this program;     --
-- see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see    --
-- <http://www.gnu.org/licenses/>.                                          --
--                                                                          --
-- GNAT was originally developed  by the GNAT team at  New York University. --
-- Extensive contributions were provided by Ada Core Technologies Inc.      --
--                                                                          --
------------------------------------------------------------------------------

with Elists;  use Elists;
with System;  use System;
with Tree_IO; use Tree_IO;

package body Stand is

   ---------------
   -- Tree_Read --
   ---------------

   procedure Tree_Read is
   begin
      Tree_Read_Data (Standard_Entity'Address,
                       Standard_Entity_Array_Type'Size / Storage_Unit);

      Tree_Read_Int (Int (Standard_Package_Node));
      Tree_Read_Int (Int (Last_Standard_Node_Id));
      Tree_Read_Int (Int (Last_Standard_List_Id));

      Tree_Read_Int (Int (Boolean_Literals (False)));
      Tree_Read_Int (Int (Boolean_Literals (True)));

      Tree_Read_Int (Int (Standard_Void_Type));
      Tree_Read_Int (Int (Standard_Exception_Type));
      Tree_Read_Int (Int (Standard_A_String));
      Tree_Read_Int (Int (Standard_A_Char));
      Tree_Read_Int (Int (Standard_Debug_Renaming_Type));

      --  Deal with Predefined_Float_Types, which is an Elist. We wrote the
      --  entities out in sequence, terminated by an Empty entry.

      declare
         Elmt : Entity_Id;
      begin
         Predefined_Float_Types := New_Elmt_List;
         loop
            Tree_Read_Int (Int (Elmt));
            exit when Elmt = Empty;
            Append_Elmt (Elmt, Predefined_Float_Types);
         end loop;
      end;

      --  Remainder of special entities

      Tree_Read_Int (Int (Any_Id));
      Tree_Read_Int (Int (Any_Type));
      Tree_Read_Int (Int (Any_Access));
      Tree_Read_Int (Int (Any_Array));
      Tree_Read_Int (Int (Any_Boolean));
      Tree_Read_Int (Int (Any_Character));
      Tree_Read_Int (Int (Any_Composite));
      Tree_Read_Int (Int (Any_Discrete));
      Tree_Read_Int (Int (Any_Fixed));
      Tree_Read_Int (Int (Any_Integer));
      Tree_Read_Int (Int (Any_Modular));
      Tree_Read_Int (Int (Any_Numeric));
      Tree_Read_Int (Int (Any_Real));
      Tree_Read_Int (Int (Any_Scalar));
      Tree_Read_Int (Int (Any_String));
      Tree_Read_Int (Int (Raise_Type));
      Tree_Read_Int (Int (Universal_Integer));
      Tree_Read_Int (Int (Universal_Real));
      Tree_Read_Int (Int (Universal_Fixed));
      Tree_Read_Int (Int (Standard_Integer_8));
      Tree_Read_Int (Int (Standard_Integer_16));
      Tree_Read_Int (Int (Standard_Integer_32));
      Tree_Read_Int (Int (Standard_Integer_64));
      Tree_Read_Int (Int (Standard_Short_Short_Unsigned));
      Tree_Read_Int (Int (Standard_Short_Unsigned));
      Tree_Read_Int (Int (Standard_Unsigned));
      Tree_Read_Int (Int (Standard_Long_Unsigned));
      Tree_Read_Int (Int (Standard_Long_Long_Unsigned));
      Tree_Read_Int (Int (Standard_Unsigned_64));
      Tree_Read_Int (Int (Abort_Signal));
      Tree_Read_Int (Int (Standard_Op_Rotate_Left));
      Tree_Read_Int (Int (Standard_Op_Rotate_Right));
      Tree_Read_Int (Int (Standard_Op_Shift_Left));
      Tree_Read_Int (Int (Standard_Op_Shift_Right));
      Tree_Read_Int (Int (Standard_Op_Shift_Right_Arithmetic));
   end Tree_Read;

   ----------------
   -- Tree_Write --
   ----------------

   procedure Tree_Write is
   begin
      Tree_Write_Data (Standard_Entity'Address,
                       Standard_Entity_Array_Type'Size / Storage_Unit);

      Tree_Write_Int (Int (Standard_Package_Node));
      Tree_Write_Int (Int (Last_Standard_Node_Id));
      Tree_Write_Int (Int (Last_Standard_List_Id));

      Tree_Write_Int (Int (Boolean_Literals (False)));
      Tree_Write_Int (Int (Boolean_Literals (True)));

      Tree_Write_Int (Int (Standard_Void_Type));
      Tree_Write_Int (Int (Standard_Exception_Type));
      Tree_Write_Int (Int (Standard_A_String));
      Tree_Write_Int (Int (Standard_A_Char));
      Tree_Write_Int (Int (Standard_Debug_Renaming_Type));

      --  Deal with Predefined_Float_Types, which is an Elist. Write the
      --  entities out in sequence, terminated by an Empty entry.

      declare
         Elmt : Elmt_Id;

      begin
         Elmt := First_Elmt (Predefined_Float_Types);
         while Present (Elmt) loop
            Tree_Write_Int (Int (Node (Elmt)));
            Next_Elmt (Elmt);
         end loop;

         Tree_Write_Int (Int (Empty));
      end;

      --  Remainder of special entries

      Tree_Write_Int (Int (Any_Id));
      Tree_Write_Int (Int (Any_Type));
      Tree_Write_Int (Int (Any_Access));
      Tree_Write_Int (Int (Any_Array));
      Tree_Write_Int (Int (Any_Boolean));
      Tree_Write_Int (Int (Any_Character));
      Tree_Write_Int (Int (Any_Composite));
      Tree_Write_Int (Int (Any_Discrete));
      Tree_Write_Int (Int (Any_Fixed));
      Tree_Write_Int (Int (Any_Integer));
      Tree_Write_Int (Int (Any_Modular));
      Tree_Write_Int (Int (Any_Numeric));
      Tree_Write_Int (Int (Any_Real));
      Tree_Write_Int (Int (Any_Scalar));
      Tree_Write_Int (Int (Any_String));
      Tree_Write_Int (Int (Raise_Type));
      Tree_Write_Int (Int (Universal_Integer));
      Tree_Write_Int (Int (Universal_Real));
      Tree_Write_Int (Int (Universal_Fixed));
      Tree_Write_Int (Int (Standard_Integer_8));
      Tree_Write_Int (Int (Standard_Integer_16));
      Tree_Write_Int (Int (Standard_Integer_32));
      Tree_Write_Int (Int (Standard_Integer_64));
      Tree_Write_Int (Int (Standard_Short_Short_Unsigned));
      Tree_Write_Int (Int (Standard_Short_Unsigned));
      Tree_Write_Int (Int (Standard_Unsigned));
      Tree_Write_Int (Int (Standard_Long_Unsigned));
      Tree_Write_Int (Int (Standard_Long_Long_Unsigned));
      Tree_Write_Int (Int (Standard_Unsigned_64));
      Tree_Write_Int (Int (Abort_Signal));
      Tree_Write_Int (Int (Standard_Op_Rotate_Left));
      Tree_Write_Int (Int (Standard_Op_Rotate_Right));
      Tree_Write_Int (Int (Standard_Op_Shift_Left));
      Tree_Write_Int (Int (Standard_Op_Shift_Right));
      Tree_Write_Int (Int (Standard_Op_Shift_Right_Arithmetic));
   end Tree_Write;

end Stand;
