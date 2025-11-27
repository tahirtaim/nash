<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {

        $super_admin_role = Role::updateOrCreate(
            ['name' => 'Super Admin'],
            [
                'name' => 'Super Admin',
                'guard_name' => 'web'
            ]
        );



        // Create admin
        $sup_admin = [
            'name' => 'SuperAdmin',
            'email' => 'superadmin@gmail.com',
            'password' => Hash::make('12345678'),
        ];

        $super_admin = User::updateOrCreate(
            ['email' => $sup_admin['email']],
            $sup_admin
        );
        // Assign Role to User
        $super_admin->assignRole($super_admin_role->name);



        // Create Permissions
        $permissions = [
            'dashboard view',
            'dynamic-pages view',
            'dynamic-pages create',
            'dynamic-pages edit',
            'dynamic-pages delete',
            'review view',
            'review create',
            'review edit',
            'review delete',
            'offer view',
            'offer create',
            'offer edit',
            'offer delete',
            'video view',
            'video create',
            'video edit',
            'video delete',
            'blog view',
            'blog create',
            'blog edit',
            'blog delete',
            'banner view',
            'banner status',
            'banner create',
            'banner edit',
            'banner delete',
            'product view',
            'product create',
            'product edit',
            'product delete',
            'promocode view',
            'promocode create',
            'promocode edit',
            'promocode delete',
            'category view',
            'category create',
            'category edit',
            'category delete',
            'mail setting update',
            'profile setting update',
            'system setting update',
            'admin setting update',
            'order view',
            'order update status',
            'user view',
            'role management',
            'permission view',
            'newsletter management',
        ];

        foreach ($permissions as $permission) {
            Permission::updateOrCreate(
                ['name' => $permission],
                ['guard_name' => 'web']
            );
        }


        // Assign Permissions to Super Admin
        $permissions = Permission::pluck('name')->toArray();
        $super_admin_role->syncPermissions($permissions);
    }
}
