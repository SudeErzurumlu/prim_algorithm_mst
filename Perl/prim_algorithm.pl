use strict;
use warnings;
use List::Util qw(min);

sub prim {
    my ($graph, $n) = @_;
    my @visited = (0) x $n;
    $visited[0] = 1;
    my $cost = 0;

    for my $i (1 .. $n - 1) {
        my $min_weight = 1_000_000;
        my $node = -1;
        for my $u (0 .. $n - 1) {
            if ($visited[$u]) {
                for my $edge (@{$graph->[$u]}) {
                    my ($v, $w) = @$edge;
                    if (!$visited[$v] && $w < $min_weight) {
                        $min_weight = $w;
                        $node = $v;
                    }
                }
            }
        }
        if ($node != -1) {
            $visited[$node] = 1;
            $cost += $min_weight;
        }
    }
    return $cost;
}

my $graph = [
    [[1, 4], [2, 3]],
    [[0, 4], [2, 1], [3, 2]],
    [[0, 3], [1, 1], [3, 4]],
    [[1, 2], [2, 4]]
];
print "Minimum Cost: ", prim($graph, 4), "\n";
