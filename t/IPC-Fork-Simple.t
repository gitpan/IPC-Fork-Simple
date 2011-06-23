# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl IPC-Fork-Simple.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use Test::More;
BEGIN { plan tests => 7 }
use IPC::Fork::Simple qw/partition_list/;
ok( 1 );    # If we made it this far, we're ok.

is_deeply( [partition_list( 3, [1 .. 10] )], [[1, 2, 3, 4], [5, 6, 7], [8, 9, 10]], 'partition_list 3/10' );

is_deeply( [partition_list( 3, [1 .. 11] )], [[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11]], 'partition_list 3/11' );

is_deeply( [partition_list( 3, [1 .. 9] )], [[1, 2, 3,], [4, 5, 6,], [7, 8, 9]], 'partition_list 3/9' );

is_deeply( [partition_list( 3, [1 .. 2] )], [[1,], [2,], []], 'partition_list 3/2' );

is_deeply( [partition_list( 3, [] )], [[], [], []], 'partition_list 3/0' );

is_deeply( [partition_list( 0, [1] )], [[1]], 'partition_list 0/1' );

# Done
