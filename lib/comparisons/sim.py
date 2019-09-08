import random 
import queue
import csv
import os

from sklearn.model_selection import ParameterGrid

def average(lst): 
    return sum(lst) / float(len(lst))

# --- Hyperparameters based off of assumptions --- #

# Assume reviewers have an independent 75% probability of choosing the better application
HUMAN_COMPARISON_SUCCESS_RATE = 0.75


# --- Toggles --- #
NUM_RUNS = 100
LOG_DIR = "../../log"


def simulate_and_compute_params(bonus=2, penalty=2, threshold=-7, apps_total=250, apps_cutoff=50, runs=10):
    class AppMeta:
        def __init__(self, rank, wins, losses): 
            self.rank = rank 
            self.wins = wins
            self.losses = losses 

        @property
        def score(self): 
            return self.wins * bonus - self.losses * penalty
        
        @property
        def alive(self):
            return self.score > threshold

        def __lt__(self, other): 
            # Add nondeterministic factor to __lt__ for random retrieval of equal W/L items from heap
            return ((self.wins + self.losses), random.random()) < ((other.wins + other.losses), random.random())

    class Statistics:
        def __init__(self): 
            self.num_comparisons = []
            self.false_negatives_top_10 = []
            self.false_negatives_top_20 = []
            self.false_negatives_top_40 = []

        def update(self, nc, fn10, fn20, fn40): 
            self.num_comparisons.append(nc)
            self.false_negatives_top_10.append(fn10)
            self.false_negatives_top_20.append(fn20)
            self.false_negatives_top_40.append(fn40)

        @property
        def aggregate(self):
            return { 
                "NUM COMPARISONS": average(self.num_comparisons), 
                "FALSE NEGATIVES TOP 10": average(self.false_negatives_top_10), 
                "FALSE NEGATIVES TOP 20": average(self.false_negatives_top_20), 
                "FALSE NEGATIVES TOP 40": average(self.false_negatives_top_40), 
            }

    statistics = Statistics()

    for i in range(runs):
        # Create scoreboard objects
        app_metadata = { j: AppMeta(j, 0, 0) for j in range(apps_total) }
        num_comparisons = 0
        num_remaining = apps_total

        # Construct heap that returns apps with min total comparisons
        comparison_heap = queue.PriorityQueue(apps_total)
        for _, app_meta in app_metadata.items():
            comparison_heap.put(app_meta)

        # Continue running simulation until the number of remaining apps is apps_cutoff
        while num_remaining > apps_cutoff: 
            # By preserving rank order, left is always stronger than right
            left, right = comparison_heap.get(), comparison_heap.get()
            left, right = sorted([left, right], key=lambda a: a.rank)

            choose_correct_ranking = random.random() <= HUMAN_COMPARISON_SUCCESS_RATE
            if choose_correct_ranking: 
                left.wins += 1
                right.losses += 1
            else: 
                left.losses += 1
                right.wins += 1
            
            # Only add back to heap if score is above threshold
            if left.alive:
                comparison_heap.put(left)
            else: 
                num_remaining -= 1

            if right.alive:
                comparison_heap.put(right)
            else: 
                num_remaining -= 1
            
            num_comparisons += 1
        
        # Evaluate results
        final_ranking = []
        while not comparison_heap.empty():
            final_ranking.append(comparison_heap.get())
        final_ranking.sort(key=lambda a: (a.score, a.wins), reverse=True)

        final_set = { a.rank for a in final_ranking }

        fn10 = len([1 for j in range(10) if j not in final_set])
        fn20 = len([1 for j in range(20) if j not in final_set])
        fn40 = len([1 for j in range(40) if j not in final_set])

        statistics.update(num_comparisons, fn10, fn20, fn40)

    return statistics 


def grid_search():
    param_grid = {
        "bonus": list(range(1, 3, 1)), 
        "penalty": list(range(2, 3, 1)), 
        "threshold": list(range(-5, -13, -2)), 
        "apps_total": list(range(200, 350, 50)), 
        "apps_cutoff": list(range(50, 150, 50)), 
        "runs": [NUM_RUNS], 
    }
    param_grid = ParameterGrid(param_grid)

    aggregate_list = []
    
    # Grid search to collect all statistics
    for params in param_grid:
        print("Simulating %d runs with params %s" % (NUM_RUNS, params))
        statistics = simulate_and_compute_params(**params)
        aggregate = statistics.aggregate

        combined = { **params, **aggregate }
        aggregate_list.append(combined)
            
    # Write all data to csv log
    outfile_name = "compare_sim.csv"
    outpath = os.path.join(LOG_DIR, outfile_name)
    with open(outpath, "w") as f: 
        csvwriter = csv.DictWriter(f, aggregate_list[0].keys())
        csvwriter.writeheader()
        csvwriter.writerows(aggregate_list)
    
    print("Done! Find the output summary at %s" % os.path.abspath(outpath))


if __name__ == "__main__":
    grid_search()