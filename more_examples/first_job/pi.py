import random

# Function to check if a point is inside the unit circle
def is_in_circle(x, y):
    return x**2 + y**2 <= 1

# Function to perform Monte Carlo simulation to estimate pi
def estimate_pi(num_points):
    inside_circle = 0

    for _ in range(num_points):
        # Randomly generate (x, y) point in the square [-1, 1] x [-1, 1]
        x = random.uniform(-1, 1)
        y = random.uniform(-1, 1)

        # Check if the point falls inside the unit circle
        if is_in_circle(x, y):
            inside_circle += 1

    # Ratio of points inside the circle to total points is approximately pi/4
    pi_estimate = 4 * inside_circle / num_points
    return pi_estimate

# Function to run the simulation and print the result
def run_simulation(num_points):
    pi_value = estimate_pi(num_points)
    print(f"Estimated value of pi using {num_points} points: {pi_value}")

# Main execution
if __name__ == "__main__":
    n_points = 10000000  # You can adjust the number of points for higher accuracy
    run_simulation(n_points)
